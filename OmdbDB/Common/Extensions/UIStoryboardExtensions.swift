//
//  UIStoryboardExtensions.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 1.04.2022.
//

import UIKit

extension UIStoryboard {
    
    class func initializeViewController(from storyboard: Storyboards) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        return viewController!
    }
}
