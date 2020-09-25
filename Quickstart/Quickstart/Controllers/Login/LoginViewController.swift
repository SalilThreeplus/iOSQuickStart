//
//  LoginViewController.swift
//  Quickstart
//
//  Created by Salil on 25/09/20.
//  Copyright © 2020 Salil. All rights reserved.
//

import UIKit

class LoginViewController: BaseController, BasePresenterProtocol, LoginProtocol {
    
    private var loginPresenter: LoginPresenter {
        get {
            LoginPresenter(service: LoginService(), basePresenterProtocol: self, loginProtocol: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loginPresenter.getPosts()
    }
    
}

//MARK:- Implementing login protocol
extension LoginViewController{
    func setPosts(posts: Posts) {
        print(posts)
    }
}

extension LoginViewController {
    func showLoader() {
        print("Loading...")
    }
    
    func hideLoaderWithSuccess() {
        print("Success")
    }
    
    func hideLoaderWithError() {
        print("Error")
    }
}
