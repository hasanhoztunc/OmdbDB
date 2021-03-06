//
//  MovieListViewModelDelegate.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 1.04.2022.
//

import Foundation

protocol MovieListViewModelDelegate: ViewModelDelegate {
    func loadMovies(with viewModels: [MovieTableViewCellViewModel])
    func navigateToDetail(with movie: MovieSearchModel)
}
