//
//  MovieDetailViewController.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 2.04.2022.
//

import Foundation
import UIKit
import Kingfisher

final class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        
        self.viewModel?.prepare()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        super.viewWillDisappear(animated)
    }
}

// MARK: - ViewModelDelegate

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    
    func updateView(with model: MovieSearchModel) {
        if let posterURL = URL(string: model.poster ?? "") {
            self.posterImageView.kf.setImage(with: posterURL)
        }
        self.titleLabel.text = model.title
        self.typeLabel.text = model.type
        self.yearLabel.text = model.year
    }
}
