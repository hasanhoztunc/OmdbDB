//
//  MovieDetailViewModel.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 2.04.2022.
//

import Foundation
import FirebaseAnalytics

final class MovieDetailViewModel: ViewModel {
    
    // MARK: - Publics
    
    var movie: MovieSearchModel?
    
    weak var delegate: MovieDetailViewModelDelegate?
    
    override func prepare() {
        self.logToAnalytics()
        
        if let movieDetail = self.movie {
            self.delegate?.updateView(with: movieDetail)
        }
    }
    
    private func logToAnalytics() {
        Analytics.logEvent("movie_detail", parameters: [
            "title": self.movie?.title ?? "",
            "year": self.movie?.year ?? "",
            "imdbID": self.movie?.imdbID ?? "",
            "type": self.movie?.type ?? "",
        ])
    }
}
