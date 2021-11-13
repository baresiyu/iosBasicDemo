//
//  DisclaimerViewController.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 22/10/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

import UIKit

class DisclaimerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.createButton()
    }
}

// MARK: Create Button
extension DisclaimerViewController {
    func createButton() {
        let button = UIButton(frame: CGRect(x: 20, y: 100, width: 100, height: 50)) //FIXME: set view position with constriant layout
        button.backgroundColor = .green
        button.setTitle("dismiss", for: .normal)
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonAction() {
        self.dismiss(animated: true, completion: {
            // set any action after dismiss
        })
    }
}
