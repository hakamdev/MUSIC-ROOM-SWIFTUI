//
//  OAuthButton.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/19/24.
//

import SwiftUI

struct OAuthButton: View {
    let icon: String
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button (action: action) {
            HStack {
                Image(icon)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.mainColor)
                    .frame(width: 24)
                
                Text(label)
                    .fontWeight(.semibold)
                    .foregroundColor(.mainColor)
                    .lineLimit(1)
                    .truncationMode(.middle)
            }
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.2))
            )
        }
    }
}

#Preview {
    OAuthButton(icon: "ic_ggl", label: "Google") {
        
    }
}
