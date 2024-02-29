//
//  HomeTabView.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/17/24.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            PartiesView()
                .tabItem {
                    Image(systemName: "party.popper.fill")
                }
            
            PlaylistsView()
                .tabItem {
                    Image(systemName: "play.square.stack.fill")
                }
            
            MyContentView()
                .tabItem {
                    Image(systemName: "music.note.house.fill")
                }
            
        }
        .accentColor(.mainColor)
    }
}

#Preview {
    HomeTabView()
}
