//
//  MovieTableViewCell.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 2.04.2022.
//

import UIKit
import Kingfisher

final class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var moviePosterImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    
    func configureCell(with model: MovieTableViewCellViewModel) {
        moviePosterImageView.kf.setImage(with: model.posterURL)
        movieTitleLabel.text = model.title
    }
}
