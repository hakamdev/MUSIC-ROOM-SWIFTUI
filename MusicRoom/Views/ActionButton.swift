//
//  ActionButton.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/19/24.
//

import SwiftUI

struct ActionButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button (action: action) {
            Text(label)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
                .padding(.vertical, 16)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .background(Color.mainColor.gradient)
                .cornerRadius(8)
        }
    }
}

#Preview {
    ActionButton(label: "Login") {}
}
