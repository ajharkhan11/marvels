//
//  DataModel.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 16/02/22.
//

import Foundation

struct DataModel: Codable, Equatable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [CharacterDataModel]?
}
