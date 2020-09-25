//
//  LoginViewController.swift
//  Quickstart
//
//  Created by Salil on 25/09/20.
//  Copyright © 2020 Salil. All rights reserved.
//

import UIKit

class LoginViewController: BaseController, LoginProtocol {
    
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

