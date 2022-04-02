//
//  BaseViewController.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 31.03.2022.
//

import Foundation
import UIKit

open class BaseViewController<TViewModel: ViewModel>: UIViewController, ViewControllerProtocol {
    
    // MARK: - Publics
    
    var viewModel: TViewModel?
    
    // MARK: - Privates
    
    private var indicator: UIActivityIndicatorView?
    
    // MARK: - Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel == nil {
            self.viewModel = TViewModel()
        }
        self.viewModel?.prepare()
        
        self.prepareUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        super.viewWillAppear(animated)
    }
    
    // MARK: - UI
    
    func prepareUI() {
        
    }
    
    // MARK: - Indicator
    
    func showIndicator() {
        self.indicator = UIActivityIndicatorView(style: .gray)
        self.indicator?.frame.origin = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2)
        if let indicator = indicator {
            self.view.addSubview(indicator)
            self.view.bringSubviewToFront(indicator)
        }
        self.indicator?.startAnimating()
    }
    
    func hideIndicator() {
        self.indicator?.stopAnimating()
        self.indicator?.removeFromSuperview()
    }
}
