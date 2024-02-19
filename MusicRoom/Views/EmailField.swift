//
//  EmailField.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/19/24.
//

import SwiftUI

struct EmailField: View {
    let hint: String
    @Binding var email: String
    
    var body: some View {
        TextField(hint, text: $email)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding(.horizontal)
            .padding(.vertical, 16)
            .background(.gray.opacity(0.2))
            .cornerRadius(8)
    }
}

#Preview {
    EmailField(hint: "Email", email: .constant(""))
}
