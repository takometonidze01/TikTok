//
//  DatabaseManager.swift
//  TikTok
//
//  Created by CodergirlTM on 01.02.22.
//

import Foundation
import FirebaseDatabase
import UIKit

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    private init() {}
    
    public func getAllUsers(completion: ([String]) -> Void) {
        
    }
}
