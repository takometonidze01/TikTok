//
//  StorageManager.swift
//  TikTok
//
//  Created by CodergirlTM on 01.02.22.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    static let shared = StorageManager()
    
    private let database = Storage.storage().reference()
    
    private init() {}
    
    // Public
    public func getVideoURL(with identifier: String, completion: (URL) -> Void) {
        
    }
    
    public func uploadVideoURL(from url: URL) {
        
    }
}
