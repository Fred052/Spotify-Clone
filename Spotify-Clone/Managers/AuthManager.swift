//
//  AuthManager.swift
//  Spotify-Clone
//
//  Created by Ferid Suleymanzade on 08.11.24.
//

import Foundation

final class AuthManager {
    static let  shared = AuthManager()
    
    struct Constants {
        static let clientID = "ad770cad2305473aba0ebb31446cc7ea"
        static let ClientSecret = "3f033bd74959421fa936b5b5678270b6"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "http://www.freed1.com"
        let base = "https://accounts.spotify.com/authorize"
        let string  = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(
        code: String,
    completion: @escaping ((Bool) -> Void)
   ) {
        // Get Token
    }
    
    public func refreshAccessToken() {
        
    }
    
    private func cacheToken() {
        
    }
    
}
