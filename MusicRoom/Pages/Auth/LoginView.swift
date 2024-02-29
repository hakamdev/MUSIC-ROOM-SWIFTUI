//
//  LoginView.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/17/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var navigation: NavigationViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var emailErrorMsg: String?
    @State private var passwordErrorMsg: String?
    
    func validateInput() -> Bool {
        emailErrorMsg = InputValidator.validateEmail(email)
        passwordErrorMsg = InputValidator.validatePassword(password)
        return emailErrorMsg == nil && passwordErrorMsg == nil
    }
    
    func tryLogin() {
        guard validateInput() else {
            return
        }
        
        print("Loggin in...")
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
            
            Spacer().frame(height: 16)
            
            // MARK: - Forgot Password Section
            HStack {
                Spacer()
                
                Button {
                    // action
                } label: {
                    Text("Forgot Password?")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.label))
                }
                
                
            }
            
            Spacer()
            Spacer()

            // MARK: - Login Button Section
            ActionButton(label: "Login") {
                navigation.path.append("home")
                // tryLogin()
            }
            
            Spacer().frame(height: 16)
            
            // MARK: - Signup Button Section
            Button {
                // action
//                navigation.path.popLast()
                navigation.path.replace(["login"], with: ["signup"], maxReplacements: 1)
//                navigation.path.append("signup")
            } label: {
                Text("Sign up")
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
    LoginView()
}
