//
//  ContentView.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigation: NavigationViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                navigation.path.append("login")
            }, label: {
                Text("Go to login")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationViewModel())
}
