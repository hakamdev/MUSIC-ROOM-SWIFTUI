//
//  LoginView.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/17/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var emailErrorMsg: String?
    @State private var passwordErrorMsg: String?
    
    func tryLogin() {
        guard emailErrorMsg == nil, passwordErrorMsg == nil else {
            return
        }
        
        print("Loggin in...")
    }
    
    var body: some View {
        VStack(spacing: 24) {
            
            Spacer()
            
            Image("ic_logo")
                .resizable()
                .symbolRenderingMode(.monochrome)
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
            
            Spacer()
            Spacer()

            TextField("Email", text: $email)
                    .onSubmit {
                        emailErrorMsg = InputValidator.validateEmail(email)
                    }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.horizontal)
                    .padding(.vertical, 16)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(8)
                
                SecureField("Password", text: $password)
                    .onSubmit {
                        passwordErrorMsg = InputValidator.validatePassword(password)
                    }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.horizontal)
                    .padding(.vertical, 16)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(8)
            
            HStack {
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            
            Spacer()
            Spacer()

            Button {
                
            } label: {
                Text("Log in")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .padding(.vertical, 16)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color("mainColor").gradient)
                    .cornerRadius(8)
            }
            
            Button {
                
            } label: {
                Text("Sign up")
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
        }
        .padding(24)
    }
}

#Preview {
    LoginView()
}
