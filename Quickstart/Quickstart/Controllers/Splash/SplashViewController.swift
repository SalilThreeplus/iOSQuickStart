//
//  SplashViewController.swift
//  Quickstart
//
//  Created by Salil on 25/09/20.
//  Copyright © 2020 Salil. All rights reserved.
//

import UIKit
import SnapKit
import Bond
import ReactiveKit


class SplashViewController: BaseController {
    
    private let lblLogin : UILabel = {
        let lbl = UILabel()
        lbl.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "login", comment: "")
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 22)
        return lbl
    }()
    
    private let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "Hello world"
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let txtName : UITextField = {
        let txt = UITextField()
        txt.layer.borderColor = UIColor.black.cgColor
        txt.layer.borderWidth = 0.5
        txt.returnKeyType = .done
        txt.layer.cornerRadius = 10
        return txt
    }()
    
    private let btn : UIButton = {
        let btn = UIButton.init(type: .system)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Hi", for: .normal)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
    private let btnAr : UIButton = {
        let btn = UIButton.init(type: .system)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Arabic", for: .normal)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
    
    private let btnEn : UIButton = {
        let btn = UIButton.init(type: .system)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("English", for: .normal)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        
        view.addSubview(lblLogin)
        lblLogin.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        
        view.addSubview(txtName)
        txtName.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(lblTitle.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(txtName.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        view.addSubview(btnAr)
        btnAr.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(btn.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        view.addSubview(btnEn)
        btnEn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(btnAr.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        btn
            .reactive
            .tap
            .observeNext { [weak self] in
                self?.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
        
        btnAr
            .reactive
            .tap
            .observeNext {
                UserDefaults.standard.set("ar", forKey: "lang")
                if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                    LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
                    self.lblLogin.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "login", comment: "")
                }
        }
        
        btnEn
            .reactive
            .tap
            .observeNext {
                UserDefaults.standard.set("en", forKey: "lang")
                if LocalizationSystem.sharedInstance.getLanguage() == "ar"{
                    LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
                    self.lblLogin.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "login", comment: "")
                }
        }
        
        //        combineLatest(txtName.reactive.text, txtName.reactive.text).map { (email, nil) -> Bool in
        //              return (email?.count)! > 0
        //        }.bind(to: btn.reactive.isEnabled)
        
        txtName.reactive.text.bind(to: lblTitle)
    }
}
