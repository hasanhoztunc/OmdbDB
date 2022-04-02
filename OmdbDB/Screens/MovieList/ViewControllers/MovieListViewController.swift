//
//  ViewController.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 31.03.2022.
//

import UIKit

final class MovieListViewController: BaseViewController<MovieListViewModel> {

    // MARK: - Outlets
    
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var movieListTableView: UITableView!
    
    // MARK: - Privates
    
    private var movies: [MovieTableViewCellViewModel] = []
    
    private let tableViewCellNibName = "MovieTableViewCell"
    private let tableViewCellIdentifier = "movieCell"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.delegate = self
        
        self.movieListTableView.delegate = self
        self.movieListTableView.dataSource = self
    }
    
    // MARK: - UI
    
    override func prepareUI() {
        self.movieListTableView.register(UINib(nibName: self.tableViewCellNibName, bundle: nil),
                                         forCellReuseIdentifier: self.tableViewCellIdentifier)
        self.searchTextField.addTarget(self, action: #selector(self.searchMovie), for: .primaryActionTriggered)
    }
    
    // MARK: - Actions
    
    @objc private func searchMovie() {
        self.searchTextField.resignFirstResponder()
        self.viewModel?.searchMovie(with: searchTextField.text)
    }
}

// MARK: - ViewModelDelegate

extension MovieListViewController: MovieListViewModelDelegate {
    
    func loadMovies(with viewModels: [MovieTableViewCellViewModel]) {
        self.movies.append(contentsOf: viewModels)
        self.movieListTableView.reloadData()
    }
    
    func navigateToDetail(with movie: MovieSearchModel) {
        self.pushStoryboard(with: .MovieDetail) { controller in
            if let viewController = controller as? MovieDetailViewController {
                let movieDetailViewModel = MovieDetailViewModel()
                movieDetailViewModel.movie = movie
                viewController.viewModel = movieDetailViewModel
            }
        }
    }
}

// MARK: TableViewDelegate,TableViewDataSource

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.tableViewCellIdentifier, for: indexPath) as! MovieTableViewCell
        cell.configureCell(with: self.movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.movies.count - 1 {
            self.viewModel?.loadMoreMovie()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.movieDidSelect(with: indexPath.row)
    }
}
