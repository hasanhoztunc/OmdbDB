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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.delegate = self
    }
}

// MARK: - ViewModelDelegate

extension MovieListViewController: MovieListViewModelDelegate {
    
}
