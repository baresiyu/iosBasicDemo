//
//  CustomViewAlpha.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 22/10/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

import UIKit

protocol CustomViewAlphaDelegate: class {
    func clickButtonAction(_ view: CustomViewAlpha)
}

class CustomViewAlpha: UIView {

    @IBOutlet weak var franz: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // deleagte MUST weak -> can google memory leak
    weak var delegate: CustomViewAlphaDelegate?
    
    static func instantiate() -> CustomViewAlpha {
        let view = UINib(nibName: "CustomViewAlpha", bundle: nil).instantiate(withOwner: nil, options: nil).first as! CustomViewAlpha
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        self.delegate?.clickButtonAction(self)
    }
    
}
