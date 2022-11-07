//
//  APIServices.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 20/02/22.
//

import UIKit

class APIService :  NSObject {
    
    private var httpManager = HTTPManager.shared
    
    private var jsonParser = JSONParser.shared
    
    func apiToGetCharactersData(params:[String: String] , completion : @escaping ([CharacterDataModel]?, NSException?) -> ()){
        httpManager.get(urlString: Constants.charactersURLString(), parameters: params, completionBlock: {[weak self] result in
            var charactersData : [CharacterDataModel]?
            var error : NSException?
            
            defer{
                completion(charactersData, error)
            }
            
            switch result {
            case .success(let data):
                if let parseData = self?.jsonParser.parse(json: data) {
                    charactersData = parseData
                }else {
                    error = NSException.init(name: .objectNotAvailableException, reason: "No data to read", userInfo: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func fetchCharacterDetailData(identifier: String, params:[String: String] , completion : @escaping (CharacterDataModel?, NSException?) -> ()){
        httpManager.get(urlString: Constants.characterDetailURLString(with: identifier), parameters: params, completionBlock: {[weak self] result in
            var characterDetailData : CharacterDataModel?
            var error : NSException?
            
            defer{
                completion(characterDetailData, error)
            }
            
            switch result {
            case .success(let data):
                if let parseData = self?.jsonParser.parse(json: data) {
                    if let character = parseData.first {
                        characterDetailData = character
                    }
                }else {
                    error = NSException.init(name: .objectNotAvailableException, reason: "No data to read", userInfo: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
}
