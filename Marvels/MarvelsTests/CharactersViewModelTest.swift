//
//  CharactersViewModelTest.swift
//  MarvelsTests
//
//  Created by Ajharudeen Khan on 03/02/22.
//

import XCTest

class CharactersViewModelTest: XCTestCase {

    var charactersVM = CharactersViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterDetailsVCWithCharacterID() throws {
        charactersVM.fetchCharactersData { result in
            switch result {
            case .success(let statusBool):
                if statusBool == true {
                    XCTAssertEqual(self.charactersVM.charactersCount, 20)
                    XCTAssertEqual(self.charactersVM.character(at: 0)?.name, "3-D Man")
                }else {
                    XCTFail("JSON not parsed correctly")
                }
            case .failure( _):
                XCTFail("Failed")
            }
            
        }
    }
    
    func testCharacterDetailsVCWithEmptyCharacterID() throws {
        charactersVM.fetchCharactersData { result in
            switch result {
            case .success(let statusBool):
                if statusBool == true {
                    XCTAssertEqual(self.charactersVM.charactersCount, 20)
                    XCTAssertEqual(self.charactersVM.character(at: 0)?.name, "3-D Man")
                }else {
                    XCTFail("JSON not parsed correctly")
                }
            case .failure( _):
                XCTFail("Failed")
            }
            
        }
    }
}
