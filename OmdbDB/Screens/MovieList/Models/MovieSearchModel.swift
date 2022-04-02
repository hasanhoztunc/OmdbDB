//
//  MovieSearchModel.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 2.04.2022.
//

import Foundation

struct MovieSearchModel: Codable {
    var title: String?
    var year: String?
    var imdbID: String?
    var type: String?
    var poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
