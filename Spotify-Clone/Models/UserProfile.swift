//
//  UserProfile.swift
//  Spotify-Clone
//
//  Created by Ferid Suleymanzade on 08.11.24.
//

import Foundation
    
struct UserProfile: Codable {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Bool]
        let external_urls: [String: String]
        let id: String
        let product: String
        let images: [UserImage]
    
}

struct UserImage: Codable {
    let url: String
}
