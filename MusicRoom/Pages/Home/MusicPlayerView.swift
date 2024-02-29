//
//  MusicPlayerView.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/22/24.
//

import SwiftUI

struct MusicPlayerView: View {

    @EnvironmentObject var spotifyController: SpotifyController

    var progressValue: Double {
        guard let _ = spotifyController.currentTrack?.duration else {
            return 0.0
        }
        
        let progInSec = Double(spotifyController.playbackPosition)
        let totalInSec = Double(spotifyController.currentTrack!.duration)
        
        let val: Double = progInSec / totalInSec
        let roundVal = Double(round(100 * val) / 100)
        return roundVal
    }

    var trackTime: String {
        if let dur = spotifyController.currentTrack?.duration {
            let durInSeconds = dur / 1000;
            return "\(String(format: "%02d", durInSeconds / 60)):\(String(format: "%02d", durInSeconds % 60))"
        }
        return "--:--"
    }

    var currentTrackTime: String {
        if let _ = spotifyController.currentTrack?.duration {
            let durInSeconds = spotifyController.playbackPosition / 1000;
            return "\(String(format: "%02d", durInSeconds / 60)):\(String(format: "%02d", durInSeconds % 60))"
        }
        return "--:--"
    }

    var body: some View {
        VStack {
            Image("art_placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
                .padding(.horizontal, 24)
                .padding(.top, 24)
            
            Spacer().frame(height: 100)
            
            Text(spotifyController.currentTrack?.name ?? "Connecting to Spotify...")
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2, reservesSpace: true)
            
            Spacer().frame(height: 52)
            
            if spotifyController.appRemote.isConnected {
                ProgressView(value: progressValue)
                    .frame(maxWidth: .infinity)
                    .frame(height: 8)
                    .scaleEffect(x: 1, y: 6, anchor: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            } else {
                ProgressView(value: 0)
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
                    .frame(height: 8)
            }
            
            Spacer().frame(height: 8)
            
            HStack {
                Text(currentTrackTime)
                    .font(.footnote)
                    .fontWeight(.medium)
                    //.frame(width: 50)

                Spacer()
                
                Text(trackTime)
                    .font(.footnote)
                    .fontWeight(.medium)
                    //.frame(width: 50)
            }
            
            Spacer().frame(height: 52)
            
            HStack(spacing: 56) {
                Button {
                    spotifyController.appRemote.playerAPI?.skip(toPrevious: { _, error in
                    })
                } label: {
                    Image(systemName: "backward.fill")
                        .font(.title)
                }
                Button {
                    if (spotifyController.isPaused) {
                        spotifyController.appRemote.playerAPI?.resume()
                    } else {
                        spotifyController.appRemote.playerAPI?.pause()
                    }
                } label: {
                    Image(systemName: spotifyController.isPaused ? "play.fill" : "pause.fill")
                        .font(.system(size: 52))
                }
                Button {
                    spotifyController.appRemote.playerAPI?.skip(toNext: { _, error in
                    })
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.title)
                }
            }
            
            Spacer()
        }
        .padding(32)
        .accentColor(Color.mainColor)
    }
}

#Preview {
    MusicPlayerView()
        .environmentObject(SpotifyController())
}
