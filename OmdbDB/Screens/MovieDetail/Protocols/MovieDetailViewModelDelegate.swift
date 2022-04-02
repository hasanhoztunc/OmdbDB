//
//  MovieDetailViewModelDelegate.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 2.04.2022.
//

import Foundation

protocol MovieDetailViewModelDelegate: ViewModelDelegate {
    func updateView(with model: MovieSearchModel)
}
