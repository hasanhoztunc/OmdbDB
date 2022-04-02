//
//  SplashViewController.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 31.03.2022.
//

import Foundation
import UIKit

final class SplashViewController: BaseViewController<SplashViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.delegate = self
    }
}

// MARK: - ViewModelDelegate

extension SplashViewController: SplashViewModelDelegate {
     
    func notConnectedToInternet() {
        self.showAlert(with: { configuration in
            configuration.title = "You are not connected to internet"
        }, action: { _ in
            exit(0)
        })
    }
    
    func configurationsReceived(title: String) {
        self.perform { [weak self] in
            self?.titleLabel.text = title
        }
    }
    
    func navigate(to storyboard: Storyboards) {
        self.pushStoryboard(with: storyboard)
    }
}
