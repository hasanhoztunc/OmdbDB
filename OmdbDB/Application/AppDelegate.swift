//
//  AppDelegate.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 31.03.2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                    
        FirebaseApp.configure()
        app.router.startTheApp()
        
        return true
    }
}

