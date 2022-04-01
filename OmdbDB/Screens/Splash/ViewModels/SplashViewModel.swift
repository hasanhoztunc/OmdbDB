//
//  SplashPresenter.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 31.03.2022.
//

import Foundation

final class SplashViewModel: ViewModel {
    
    // MARK: - Publics
    
    weak var delegate: SplashViewModelDelegate?
    
    override func prepare() {
        super.prepare()
        
        let isConnectedToInternet = self.checkIsDeviceConnectedToInternet()
        if !isConnectedToInternet {
            self.delegate?.notConnectedToInternet()
            return
        }
        self.fetchConfigurations()
    }
    
    // MARK: - Helpers
    
    private func fetchConfigurations() {
        app.appConfiguration.fetchAppConfig(with: .SplashText) { [weak self] splashText in
            self?.delegate?.configurationsReceived(title: splashText ?? "")
            self?.navigateAfterDelay()
        }
    }
    
    private func checkIsDeviceConnectedToInternet() -> Bool {
        return NetworkService.shared.isConnectedToInternet()
    }
    
    private func navigateAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.delegate?.navigate(to: .MovieList)
        }
    }
}
