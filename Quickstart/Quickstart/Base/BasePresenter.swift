//
//  BasePresenter.swift
//  Quickstart
//
//  Created by Salil on 25/09/20.
//  Copyright © 2020 Salil. All rights reserved.
//

import Foundation

protocol BasePresenterProtocol: NSObjectProtocol {
    func showLoader()
    func hideLoaderWithSuccess()
    func hideLoaderWithError()
}


class BasePresenter {
    weak private var bp : BasePresenterProtocol?    
    init(basePresenterProtocol: BasePresenterProtocol) {
        bp = basePresenterProtocol
    }
}
