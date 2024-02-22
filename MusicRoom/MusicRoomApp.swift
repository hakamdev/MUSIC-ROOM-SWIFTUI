//
//  MusicRoomApp.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/17/24.
//

import SwiftUI

@main
struct MusicRoomApp: App {
    
    @StateObject var spotifyController = SpotifyController()
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SignUpView()
                .onOpenURL { url in
                    print("URL opened: \(url)")
                    spotifyController.setAccessToken(from: url)
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification)) { _ in
                    spotifyController.connect()
                }
                .accentColor(Color.mainColor)
                .environmentObject(spotifyController)
        }
    }
    
//    class AppDelegate: NSObject, UIApplicationDelegate {
//        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//            return true
//        }
//        
//        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//            return true
//        }
//    }
}
