//
//  User.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 07.05.2022.
//

import Foundation

struct ProfileBaseResponse: Decodable {
    let response: [User]
}

struct User: Decodable, Identifiable {
    let id: Int
    let first_name: String
    let last_name: String
    
    static func getUserId() -> Int {
        return UserDefaults.standard.value(forKey: AppStorageProperties.UserId) as? Int ?? 0
    }
}



