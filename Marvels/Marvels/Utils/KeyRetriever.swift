//
//  KeyRetriever.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 19/02/22.
//

import Foundation

protocol KeyRetriever {
    
    var publicKey: String? {get}
    var privateKey: String? {get}
}

class EnvironmentVariableKeyRetriever: KeyRetriever {
    
    var publicKey: String? {
        ProcessInfo.processInfo.environment["PUBLIC_KEY"]
    }
    var privateKey: String? {
        ProcessInfo.processInfo.environment["PRIVATE_KEY"]
    }
}
