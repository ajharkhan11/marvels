//
//  CharacterDetailJSONMapping.swift
//  MarvelsTests
//
//  Created by Ajharudeen Khan on 03/02/22.
//

import XCTest

class CharacterDetailJSONMapping: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterJSONMapping() throws {
        let testBundle = Bundle(for: type(of: self))
        guard let filePath = testBundle.path(forResource: "CharacterDetailResponse",ofType: "json") else{
            XCTFail("Missing file: CharacterDetailResponse.json")
            return
        }
        let filePathURL = URL(fileURLWithPath: filePath)
        if let data = try? Data(contentsOf: filePathURL, options: .mappedIfSafe) {
            let results = JSONParser.shared.parse(json: data)
            if let characterData = results {
                XCTAssertNotNil(characterData)
                XCTAssertEqual(characterData.first?.name, "3-D Man")
                XCTAssertEqual(characterData.first?.id, 1011334)
            }else {
                XCTFail("No JSON data found")
            }
        }else {
            XCTFail("No JSON data found")
        }
    }
}
