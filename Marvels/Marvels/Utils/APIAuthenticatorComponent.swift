//
//  APIAuthenticatorComponent.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 19/02/22.
//

import Foundation
import CryptoKit

protocol APIAuthenticatorComponent {
    
    func authenticate(with timestamp: TimeInterval) -> [String: String]?
}

class MD5Authenticator: APIAuthenticatorComponent {
    
    private let keys: KeyRetriever
    init(keyData: KeyRetriever) {
        keys = keyData
    }
    
    func authenticate(with timestamp: TimeInterval) -> [String: String]? {
        guard let publicKey = keys.publicKey, let privateKey = keys.privateKey else { return nil }
        let ts = String(Int(timestamp))
        let fullKey = ts + privateKey + publicKey
        guard let data = fullKey.data(using: .utf8) else { return nil }
        let hashValueMD5 = Insecure.MD5.hash(data: data).map { String(format: "%02hhx", $0) }.joined()
        return ["hash": hashValueMD5, "apikey": publicKey, "ts": ts]
    }
}
