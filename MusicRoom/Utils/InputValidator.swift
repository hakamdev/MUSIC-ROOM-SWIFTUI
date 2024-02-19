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
    
    static func validatePasswords(_ password1: String, _ password2: String) -> String? {
        let err2 = validatePassword(password2)
        
        guard err2 == nil else {
            return err2
        }
        
        guard password1 == password2 else {
            return "Passwords don't match!"
        }
        
        return nil
    }
    
}
