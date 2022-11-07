//
//  CharacterDetailModelTest.swift
//  MarvelsTests
//
//  Created by Ajharudeen Khan on 03/02/22.
//

import XCTest

class CharacterDetailModelTest: XCTestCase {

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


    func testcharacterDetailsAPICall()
    {
        let expectation = XCTestExpectation.init(description: "Character Detail API")
        let params = apiAuthenticator.authenticate(with: Date().timeIntervalSince1970)
        httpManager.get(urlString: Constants.characterDetailURLString(with: "1017100"), parameters: params!, completionBlock: {result in
            switch result {
            case .success( _):
                expectation.fulfill()
            case .failure( _):
                XCTFail("Fail")
            }
        })
        self.wait(for: [expectation], timeout: 20)
    }
    
    func testcharacterDetailsAPICallFailure()
    {
        let expectation = XCTestExpectation.init(description: "Character Detail API")
        let params = apiAuthenticator.authenticate(with: Date().timeIntervalSince1970)
        httpManager.get(urlString: Constants.characterDetailURLString(with: ""), parameters: params!, completionBlock: {result in
            switch result {
            case .success( _):
                XCTFail("API with nil character id should not work")
            case .failure(let error):
                XCTAssertNotNil(error.localizedDescription)
                expectation.fulfill()
            }
        })
        self.wait(for: [expectation], timeout: 20)
    }
}
