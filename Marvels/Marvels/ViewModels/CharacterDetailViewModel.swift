//
//  CharacterDetailViewModel.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 16/02/22.
//

import Foundation

class CharacterDetailViewModel {
    private var apiService : APIService!
    
    private var identifier : String
    
    var bindCharactersDetailViewModelToController : (() -> ()) = {}
    
    private(set) var characterDetail : CharacterDataModel?{
        didSet{
            self.bindCharactersDetailViewModelToController()
        }
    }
    
    var apiAuthenticator: MD5Authenticator {
        MD5Authenticator(keyData: EnvironmentVariableKeyRetriever())
    }
    
    init(identifier : String) {
        self.identifier = identifier
        self.apiService = APIService()
        callFuncToGetMoviesData()
    }
    
    func callFuncToGetMoviesData()  {
        guard let params = apiAuthenticator.authenticate(with: Date().timeIntervalSince1970) else {return}
        self.apiService.fetchCharacterDetailData(identifier: self.identifier, params: params, completion: { (characterDetails, exception) in
            self.characterDetail = characterDetails
        })
    }
}

extension CharacterDetailViewModel {
    var characterImageURLString: String {
        guard let charDetail = characterDetail, let charThumbnail = charDetail.thumbnail, let path = charThumbnail.path, let imageExtension = charThumbnail.imageExtension else {return ""}
        let imageURLString = path + ".\(imageExtension)"
        return imageURLString
    }
}
