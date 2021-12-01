//
//  CustomViewBeta.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 22/10/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

import UIKit

class CustomViewBeta: UIView {
    
    var label: UILabel?

    func commonInit() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BetaText"
        self.addSubview(label)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]|", options: [], metrics: nil, views: ["label": label]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: [], metrics: nil, views: ["label": label]))
    }

}
