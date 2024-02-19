//
//  SignUpView.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/17/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    @State private var emailErrorMsg: String?
    @State private var passwordErrorMsg: String?
    @State private var passwordErrorMsg2: String?
    
    func validateInput() -> Bool {
        emailErrorMsg = InputValidator.validateEmail(email)
        passwordErrorMsg = InputValidator.validatePassword(password)
        passwordErrorMsg2 = InputValidator.validatePasswords(password, password2)
        return emailErrorMsg == nil && passwordErrorMsg == nil && passwordErrorMsg2 == nil
    }
    
    func trySignup() {
        guard validateInput() else {
            return
        }
        
        print("Signing up...")
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // MARK: - Logo Section
            Image("ic_logo")
                .resizable()
                .symbolRenderingMode(.monochrome)
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
            
            Spacer()
            Spacer()
            
            // MARK: - Email Input Section
            EmailField(hint: "Email", email: $email)
                .onChange(of: email) {
                    emailErrorMsg = nil
                }

            if (emailErrorMsg != nil) {
                Spacer().frame(height: 8)
                FieldErrorMessage(message: emailErrorMsg!)
            }
            
            Spacer().frame(height: 24)

            // MARK: - Password Input Section
            PasswordField(hint: "Password", password: $password)
                .onChange(of: password) {
                    passwordErrorMsg = nil
                }
            
            if (passwordErrorMsg != nil) {
                Spacer().frame(height: 8)
                FieldErrorMessage(message: passwordErrorMsg!)
            }
            
            Spacer().frame(height: 24)

            // MARK: - Password 2 Input Section
            PasswordField(hint: "Repeat Password", password: $password2)
                .onChange(of: password2) {
                    passwordErrorMsg2 = nil
                }
            
            if (passwordErrorMsg2 != nil) {
                Spacer().frame(height: 8)
                FieldErrorMessage(message: passwordErrorMsg2!)
            }
            
            Spacer()
            Spacer()

            // MARK: - Login Button Section
            ActionButton(label: "Sign up") {
                trySignup()
            }
            
            Spacer().frame(height: 16)
            
            // MARK: - Signup Button Section
            Button {
                // action
            } label: {
                Text("Log in")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.label))
            }
            
            Spacer().frame(height: 42)
            
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 50, height: 2)
                .foregroundColor(.gray.opacity(0.3))
            
            Spacer().frame(height: 24)
            
            // MARK: - OAuth Buttons Section
            HStack {
                OAuthButton(icon: "ic_ggl", label: "Google") {
                    // action
                }
                
                OAuthButton(icon: "ic_fb", label: "Facebook") {
                    // action
                }
            }
            
            // Spacer()
            
        }
        .padding(24)
    }
}

#Preview {
    SignUpView()
}
