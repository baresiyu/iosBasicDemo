//
//  DetailViewController.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 22/10/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.addCustomView()
    }
}

// MARK: add Custom View
extension DetailViewController {
    func addCustomView() {
        let customViewAlpha = CustomViewAlpha.instantiate()
        customViewAlpha.delegate = self
        self.view.addSubview(customViewAlpha)
        
        let customViewBeta = CustomViewBeta()
        customViewBeta.translatesAutoresizingMaskIntoConstraints = false
        customViewBeta.commonInit()
        self.view.addSubview(customViewBeta)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[customViewAlpha]-16-|", options: [], metrics: nil, views: ["customViewAlpha": customViewAlpha]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[customViewBeta]-16-|", options: [], metrics: nil, views: ["customViewBeta": customViewBeta]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[customViewAlpha]-8-[customViewBeta(100)]-100-|", options: [], metrics: nil, views: ["customViewAlpha": customViewAlpha, "customViewBeta": customViewBeta]))
    }

}

// MARK: CustomViewAlphaDelegate
extension DetailViewController: CustomViewAlphaDelegate {
    func clickButtonAction(_ view: CustomViewAlpha) {
        let dataManager = DataManager.sharedInstance
        view.label.text = dataManager.getString()
    }
}
