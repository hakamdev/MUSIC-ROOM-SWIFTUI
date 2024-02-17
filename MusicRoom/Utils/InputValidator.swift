//
//  InputValidator.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/17/24.
//

import Foundation

class InputValidator {
    
    static func validateEmail(_ email: String) -> String? {
        guard !email.isEmpty else {
            return "Email is empty!"
        }
        return nil
    }
    
    static func validatePassword(_ password: String) -> String? {
        guard !password.isEmpty else {
            return "Password is empty!"
        }
        return nil
    }
    
}
