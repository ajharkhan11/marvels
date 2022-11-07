//
//  CharactersViewModel.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 16/02/22.
//

import Foundation

class CharactersViewModel {
    
    private var apiService : APIService!
    
    var bindCharactersViewModelToController : (() -> ()) = {}
    
    private(set) var characters : [CharacterDataModel]?{
        didSet{
            self.bindCharactersViewModelToController()
        }
    }
    
    var apiAuthenticator: MD5Authenticator {
        MD5Authenticator(keyData: EnvironmentVariableKeyRetriever())
    }
    
    init() {
        self.apiService = APIService()
        callFuncToGetMoviesData()
    }
    
    func callFuncToGetMoviesData()  {
        guard let params = apiAuthenticator.authenticate(with: Date().timeIntervalSince1970) else {return}
        self.apiService.apiToGetCharactersData(params: params, completion: { (characters, exception) in
            self.characters = characters
        })
    }
}
