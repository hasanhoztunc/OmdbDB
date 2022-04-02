//
//  MovieListViewController.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 1.04.2022.
//

import Foundation

final class MovieListViewModel: ViewModel {
    
    // MARK: - Publics
    
    weak var delegate: MovieListViewModelDelegate?
    var movies: [MovieSearchModel] = []
    
    // MARK: - Privates
    
    private var service: Service?
    private var currentPage = 1
    private var totalResults: Int = 0
    private var searchText: String?
    
    override func prepare() {
        self.service = app.service
    }
    
    func searchMovie(with title: String?) {
        self.fetchMovies(with: title)
    }
    
    func loadMoreMovie() {
        self.currentPage += 1
        self.fetchMovies(with: self.searchText)
    }
    
    func movieDidSelect(with index: Int) {
        let movie = self.movies[index]
        self.delegate?.navigateToDetail(with: movie)
    }
    
    private func fetchMovies(with text: String?) {
        self.showIndicator(in: self.delegate)
        self.service?.execute(request: .search(text: text ?? "", page: self.currentPage),
                              responseModel: MovieSearchResponseModel.self,
                              completion: { [weak self] result in
            switch result {
            case .success(let movies):
                self?.searchText = text
                self?.movies.append(contentsOf: movies.search ?? [])
                self?.totalResults = Int(movies.totalResults ?? "") ?? 0
                let cellMovieViewModels = self?.movies.map({ MovieTableViewCellViewModel(from: $0) })
                self?.delegate?.loadMovies(with: cellMovieViewModels ?? [])
            case .failure:
                print("Hata")
            }
            self?.hideIndicator(in: self?.delegate)
        })
    }
}
