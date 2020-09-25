//
//  LoginPresenter.swift
//  Quickstart
//
//  Created by Salil on 25/09/20.
//  Copyright © 2020 Salil. All rights reserved.
//

import Foundation
import PromisedFuture

protocol LoginProtocol : NSObjectProtocol {
    func setPosts(posts: Posts)
}

class LoginPresenter: BasePresenter{
    private let ls : LoginService
    weak private var bp : BasePresenterProtocol?
    weak private var lp : LoginProtocol?

    init(service: LoginService, basePresenterProtocol: BasePresenterProtocol,  loginProtocol: LoginProtocol){
        ls = service
        lp = loginProtocol
        super.init(basePresenterProtocol: basePresenterProtocol)
    }
        
    func getPosts(){
        bp?.showLoader()
        let result = ls.getPosts()
        result.execute(onSuccess: { [weak self] (response) in
            //MARK:- All business logic goes here
            self?.bp?.hideLoaderWithSuccess()
            self?.lp?.setPosts(posts: response)
            print(response)
        }) { [weak self]  (err) in
            self?.bp?.hideLoaderWithError()
            print(err)
        }
    }
}
