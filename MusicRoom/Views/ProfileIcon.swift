//
//  ProfileIcon.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/24/24.
//

import SwiftUI

struct ProfileIcon: View {
    let action: () -> Void
    
    var body: some View {
        Button (action: action) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 32)
        }
        .accentColor(.mainColor)
    }
}

#Preview {
    ProfileIcon {
        
    }
}
