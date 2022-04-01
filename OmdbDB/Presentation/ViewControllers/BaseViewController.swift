//
//  BaseViewController.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 31.03.2022.
//

import Foundation
import UIKit

open class BaseViewController<TViewModel: ViewModel>: UIViewController, ViewControllerProtocol {
    
    var viewModel: TViewModel?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel == nil {
            self.viewModel = TViewModel()
        }
        self.viewModel?.prepare()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        super.viewWillAppear(animated)
    }
}
