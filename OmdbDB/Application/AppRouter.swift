//
//  AppRouter.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 1.04.2022.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func startTheApp() {
        let splashViewController = UIStoryboard.initializeViewController(from: .Splash)
        self.window.rootViewController = NavigationController(rootViewController: splashViewController)
        self.window.makeKeyAndVisible()
    }
}
