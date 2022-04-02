//
//  Presenter.swift
//  OmdbDB
//
//  Created by Hasan Oztunc on 31.03.2022.
//

import Foundation

open class ViewModel: NSObject {
    
    public required override init() {
        super.init()
    }
    
    func prepare() {
        
    }
    
    func showIndicator(in viewController: ViewModelDelegate?) {
        if (viewController as AnyObject?) is ViewControllerProtocol {
            let vc = viewController as! ViewControllerProtocol
            vc.showIndicator()
        }
    }
    
    func hideIndicator(in viewController: ViewModelDelegate?) {
        if (viewController as AnyObject?) is ViewControllerProtocol {
            let vc = viewController as! ViewControllerProtocol
            vc.hideIndicator()
        }
    }
}
