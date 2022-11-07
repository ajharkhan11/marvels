//
//  JSONParser.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 03/02/22.
//

import Foundation

class JSONParser {
    
    static let shared: JSONParser = JSONParser()
    
    func parse(json: Data) -> [CharacterDataModel]? {
        let decoder = JSONDecoder()
        if let jsonCharacters = try? decoder.decode(DataResponseModel.self, from: json) {
            guard let data = jsonCharacters.data, let result = data.results else {return nil}
            let characters: [CharacterDataModel] = result
            return characters
        }
        return nil
    }
}
