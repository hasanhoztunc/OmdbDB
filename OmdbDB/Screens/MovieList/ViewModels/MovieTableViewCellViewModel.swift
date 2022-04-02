//
//  MovieTableViewCellViewModel.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 2.04.2022.
//

import Foundation

struct MovieTableViewCellViewModel {
    let posterURL: URL?
    let title: String?
    
    init(from movie: MovieSearchModel) {
        self.posterURL = URL(string: movie.poster ?? "")
        self.title = movie.title
    }
}
