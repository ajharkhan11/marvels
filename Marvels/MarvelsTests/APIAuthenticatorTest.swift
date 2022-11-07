//
//  APIAuthenticatorTest.swift
//  MarvelsTests
//
//  Created by Ajharudeen Khan on 02/02/22.
//

import XCTest

class APIAuthenticatorTest: XCTestCase {
    
    private var authTest: MD5Authenticator!
    private var keyData: KeyRetrieverData!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        keyData = KeyRetrieverData()
        authTest = MD5Authenticator(keyData: keyData)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        authTest = nil
        keyData = nil
    }
    
    func testMD5DigestAPIParams(){
        
        let timestamp: Double = 17
        let expectedTsParameter = String(Int(timestamp))
        let result = authTest.authenticate(with: timestamp)
        XCTAssertEqual(result, ["hash": "c58da6dc13a64e8f9a7518ee30133fa1", "apikey": KeyRetrieverData.publicKeyData, "ts": expectedTsParameter])
    }
    
    func testMD5DigestForNoAPIKeysParams(){
        
        authTest = MD5Authenticator(keyData: KeyRetrieverEmptyData())
        XCTAssertNil(authTest.authenticate(with:17))
    }
}

private class KeyRetrieverData: KeyRetriever {

    static let publicKeyData = "1234567890"
    static let privateKeyData = "abcd"

    var publicKey: String? {
        Self.publicKeyData
    }
    var privateKey: String? {
        Self.privateKeyData
    }
}

private class KeyRetrieverEmptyData: KeyRetriever {

    var publicKey: String? {
        nil
    }
    var privateKey: String? {
        nil
    }
}
