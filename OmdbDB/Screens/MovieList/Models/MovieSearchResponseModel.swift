//
//  MovieSearchResponseModel.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 2.04.2022.
//

import Foundation

struct MovieSearchResponseModel: Codable {
    var search: [MovieSearchModel]?
    var totalResults: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
    }
}
