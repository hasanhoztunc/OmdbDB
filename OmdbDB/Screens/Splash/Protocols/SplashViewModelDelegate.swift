//
//  SplashContracts.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 31.03.2022.
//

import Foundation

protocol SplashViewModelDelegate: ViewModelDelegate {
    func notConnectedToInternet()
    func configurationsReceived(title: String)
    func navigate(to storyboard: Storyboards)
}
