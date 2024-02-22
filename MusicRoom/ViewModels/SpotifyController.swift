//
//  SpotifyController.swift
//  SpotifyQuickStart
//
//  Created by Till Hainbach on 02.04.21.
//

import SwiftUI
import SpotifyiOS
import Combine

class SpotifyController: NSObject, ObservableObject {
    private let spotifyClientID = "7271e0e80e63471795aca595b3c2bd8d"
    private let spotifyRedirectURL = URL(string:"spotify-ios-music-room://spotify-login-callback")!
    private var accessToken: String? = nil
    
    private var connectCancellable: AnyCancellable?
    private var disconnectCancellable: AnyCancellable?
    
    // Player state variables
    var playURI = ""
    var currentTrack: SPTAppRemoteTrack?
    var isPaused: Bool = true
    var playerPosition: Int = 0
    
    // Create config object with clientID and redirection URL
    lazy var configuration = SPTConfiguration(
        clientID: spotifyClientID,
        redirectURL: spotifyRedirectURL
    )

    // Create appRemote object that will be used to control music playback
    lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
        appRemote.connectionParameters.accessToken = self.accessToken
        appRemote.delegate = self
        return appRemote
    }()
    
    // Listen for UIApplication lifecycle events and connect or disconnect from Spotify App.
    override init() {
        super.init()
        connectCancellable = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.connect()
            }
        
        disconnectCancellable = NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.disconnect()
            }

    }
    
    func playTrack(withURI uri: String) {
        //        if let _ = self.appRemote.connectionParameters.accessToken {
        //            self.appRemote.authorizeAndPlayURI("")
        //            return
        //        }
        //
        //        self.appRemote.authorizeAndPlayURI("")
        if !appRemote.isConnected {
            self.connect()
            return
        }
        
        self.appRemote.playerAPI?.play(uri, asRadio: false) { data, error in
            print("Playing \(uri)")
            print(data ?? "")
        }
    }

    // When the url is available, set the accessToken.
    func setAccessToken(from url: URL) {
        let parameters = appRemote.authorizationParameters(from: url)
        
        if let accessToken = parameters?[SPTAppRemoteAccessTokenKey] {
            appRemote.connectionParameters.accessToken = accessToken
            self.accessToken = accessToken
        } else if let errorDescription = parameters?[SPTAppRemoteErrorDescriptionKey] {
            print(errorDescription)
        }
        
    }
    
    // Connect to Spotify app or play music if already connected.
    func connect() {
        guard let _ = self.appRemote.connectionParameters.accessToken else {
            self.appRemote.authorizeAndPlayURI("")
            return
        }
        appRemote.connect()
    }
    
    // If connected, disconnect from Spotify App
    func disconnect() {
        if appRemote.isConnected {
            appRemote.disconnect()
        }
    }
}

// Conform to SPT protocols to receive and handle event changes.
extension SpotifyController: SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate {
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        print("Spotify connected.")
        self.appRemote = appRemote
        self.appRemote.playerAPI?.delegate = self
        self.appRemote.playerAPI?.subscribe(toPlayerState: { (result, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            }
        })
        
//        self.appRemote.contentAPI?.fetchContentItem(forURI: "", callback: { data, error in
//            
//        })
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        print("Spotify connection failed.")
        print(error?.localizedDescription ?? "")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        print("Spotify disconnected")
        print(error?.localizedDescription ?? "")
    }
    
    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
        print("player did change \(playerState.track.name)")
    }
}
