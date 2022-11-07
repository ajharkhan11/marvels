//
//  CharacterModelTest.swift
//  MarvelsTests
//
//  Created by Ajharudeen Khan on 02/02/22.
//

import XCTest

class CharacterModelTest: XCTestCase {
    
    private var httpManager = HTTPManager.shared
    private var apiAuthenticator: MD5Authenticator {
        MD5Authenticator(keyData: EnvironmentVariableKeyRetriever())
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testcharacterAPICall()
    {
        let expectation = XCTestExpectation.init(description: "Character API")
        let params = apiAuthenticator.authenticate(with: Date().timeIntervalSince1970)
        httpManager.get(urlString: Constants.charactersURLString(), parameters: params!, completionBlock: {result in
            switch result {
            case .success( _):
                expectation.fulfill()
            case .failure( _):
                XCTFail("Fail")
            }
        })
        self.wait(for: [expectation], timeout: 20)
    }
    
    func testcharacterAPICallFailure()
    {
        let expectation = XCTestExpectation.init(description: "Character API")
        httpManager.get(urlString: Constants.charactersURLString(), parameters: ["":""], completionBlock: {result in
            switch result {
            case .success( _):
                XCTFail("API with nil parameters should not work")
            case .failure(let error):
                XCTAssertNotNil(error.localizedDescription)
                expectation.fulfill()
            }
        })
        self.wait(for: [expectation], timeout: 20)
    }
    
}

