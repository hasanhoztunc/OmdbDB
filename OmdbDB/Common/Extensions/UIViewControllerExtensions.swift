//
//  UIViewControllerExtensions.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 1.04.2022.
//

import UIKit

extension UIViewController {

    func showAlert(with configuration: (UIAlertController) -> Void, action: @escaping (UIAlertAction) -> Void) {
        let alertViewController = UIAlertController()
        configuration(alertViewController)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: action)
        
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true)
    }
    
    func perform(afterDelay: TimeInterval = 0, _ block: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + afterDelay) {
            block()
        }
    }
    
    func pushStoryboard(with storyboardName: Storyboards) {
        let storyboard = UIStoryboard.initializeViewController(from: storyboardName)
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
}
