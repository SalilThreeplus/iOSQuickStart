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

class SplashViewController: UIViewController {
    
    let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "Hello world"
        lbl.textAlignment = .center
        return lbl
    }()
    
    let txtName : UITextField = {
        let txt = UITextField()
        txt.layer.borderColor = UIColor.black.cgColor
        txt.layer.borderWidth = 0.5
        txt.returnKeyType = .done
        return txt
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
        view.addSubview(txtName)
        txtName.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(lblTitle.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        txtName.reactive.text.bind(to: lblTitle)
    }
}
