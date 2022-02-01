//
//  AuthenticationManager.swift
//  TikTok
//
//  Created by CodergirlTM on 01.02.22.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    enum SignInMethod {
        case email
        case facebook
        case google
    }
    
    // Public
    public func signIn(with method: SignInMethod) {
        
    }
    
    public func signOut() {
        
    }
}
