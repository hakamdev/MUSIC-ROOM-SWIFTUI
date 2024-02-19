//
//  FieldErrorMessage.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/19/24.
//

import SwiftUI

struct FieldErrorMessage: View {
    let message: String
    
    var body: some View {
        HStack {
            Text(message)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.red)
            
            Spacer()
        }
    }
}

#Preview {
    FieldErrorMessage(message: "Field is empty!")
}
