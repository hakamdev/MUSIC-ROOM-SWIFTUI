//
//  PasswordField.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/19/24.
//

import SwiftUI

struct PasswordField: View {
    let hint: String
    @Binding var password: String
    
    var body: some View {
        SecureField(hint, text: $password)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding(.horizontal)
            .padding(.vertical, 16)
            .background(.gray.opacity(0.2))
            .cornerRadius(8)
    }
}

#Preview {
    PasswordField(hint: "Password", password: .constant(""))
}
