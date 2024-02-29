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
    @StateObject var navigationViewModel = NavigationViewModel()
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            
//            NavigationStack(path: $navigationViewModel.path) {
//                ContentView()
//                    .environmentObject(navigationViewModel)
//                    .navigationDestination(for: String.self) { route in
//                        switch route {
//                            case "login":
//                                LoginView()
//                                    .environmentObject(navigationViewModel)
//                            case "signup":
//                                SignUpView()
//                                .environmentObject(navigationViewModel)
//                            case "home":
//                                MusicPlayerView()
//                                    .environmentObject(navigationViewModel)
//                            default:
//                                ProfileView()
//                                    .environmentObject(navigationViewModel)
//                        }
//                    }
            PartiesView()
                    .onOpenURL { url in
                        print("URL opened: \(url)")
                        spotifyController.setAccessToken(from: url)
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification)) { _ in
                        spotifyController.connect(uri: "")
                    }
                    .accentColor(Color.mainColor)
                    .environmentObject(spotifyController)
            }
    }
}
