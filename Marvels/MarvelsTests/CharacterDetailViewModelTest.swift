//
//  CharacterDetailViewModelTest.swift
//  MarvelsTests
//
//  Created by Ajharudeen Khan on 19/02/22.
//

import XCTest
@testable import Marvels

class CharacterDetailViewModelTest: XCTestCase {
    
    var characterDetailVM = CharacterDetailViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCharacterDetailsVCWithCharacterID() throws {
        characterDetailVM.fetchCharacterDetailData(id: "1017100") { result in
            switch result {
            case .success(let statusBool):
                if statusBool == true {
                    XCTAssertEqual(self.characterDetailVM.characterName, "A-Bomb (HAS)")
                    XCTAssertEqual(self.characterDetailVM.characterSeriesCount, 2)
                    XCTAssertEqual(self.characterDetailVM.characterDescription, "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ")
                }else {
                    XCTFail("JSON not parsed correctly")
                }
            case .failure( _):
                XCTFail("Failed")
            }
            
        }
    }
    
    func testCharacterDetailsVCWithEmptyCharacterID() throws {
        characterDetailVM.fetchCharacterDetailData(id: "") { result in
            switch result {
            case .success(let statusBool):
                if statusBool == true {
                    XCTAssertEqual(self.characterDetailVM.characterName, "A-Bomb (HAS)")
                }else {
                    XCTFail("JSON not parsed correctly")
                }
            case .failure( _):
                XCTFail("Failed")
            }
            
        }
    }
}
