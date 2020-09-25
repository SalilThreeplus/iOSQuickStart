//
//  BaseController.swift
//  Quickstart
//
//  Created by Salil on 25/09/20.
//  Copyright © 2020 Salil. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
class BaseController: UIViewController, BasePresenterProtocol {
    weak private var bp : BasePresenterProtocol?

    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func showLoaderIndicator(){
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    func hideLoaderWithSuccessIndicator(){
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        PKHUD.sharedHUD.show()
    }
    func hideLoaderWithErrorIndicator(){
        PKHUD.sharedHUD.contentView = PKHUDErrorView()
        PKHUD.sharedHUD.show()
    }
    
    func hideLoader(){
        PKHUD.sharedHUD.hide()
   }
}

extension BaseController {
    func showLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.showLoaderIndicator()
        }
    }
    
    func hideLoaderWithSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.hideLoaderWithSuccessIndicator()
            self?.hideLoader()
        }
    }
    
    func hideLoaderWithError() {
        DispatchQueue.main.async { [weak self] in
            self?.hideLoaderWithErrorIndicator()
            self?.hideLoader()
        }
    }
}
