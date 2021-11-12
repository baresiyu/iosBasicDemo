//
//  RootViewController.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 21/10/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    //glabol variable connect by Corrseponding xib(@IBOutlet)
    @IBOutlet weak var hihiLabel: UILabel!
    
    // life cycle 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.a()
        self.createButton()
        self.setDataManagerString()
    }
    
    // life cycle 2
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.b()
    }
    
    // life cycle 3
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.c()
    }
    
}

// MARK: life cycle testing
extension RootViewController {
    func a() { //FIXME: change func name
        print("func a")
    }
    
    func b() { //FIXME: change func name
        print("func b")
    }
    
    func c() { //FIXME: change func name
        print("func c")
    }
}

// MARK: Create Button
extension RootViewController {
    func createButton() {
        let presnetButton = UIButton(frame: CGRect(x: 20, y: 100, width: 100, height: 50)) //FIXME: set view position with constriant layout
        presnetButton.backgroundColor = .green
        presnetButton.setTitle("presnet", for: .normal)
        presnetButton.addTarget(self, action: #selector(self.presnetButtonAction), for: .touchUpInside)
        self.view.addSubview(presnetButton)
        
        let pushButton = UIButton(frame: CGRect(x: 140, y: 100, width: 100, height: 50)) //FIXME: set view position with constriant layout
        pushButton.backgroundColor = .red
        pushButton.setTitle("push", for: .normal)
        pushButton.addTarget(self, action: #selector(self.pushButtonAction), for: .touchUpInside)
        self.view.addSubview(pushButton)
        
        let pushButton2 = UIButton(frame: CGRect(x: 260, y: 100, width: 100, height: 50)) //FIXME: set view position with constriant layout
        pushButton2.backgroundColor = .blue
        pushButton2.setTitle("push2", for: .normal)
        pushButton2.addTarget(self, action: #selector(self.pushButtonAction2), for: .touchUpInside)
        self.view.addSubview(pushButton2)
    }
    
    @objc func presnetButtonAction() {
        let disclaimerVC = DisclaimerViewController()
        self.present(disclaimerVC, animated: true, completion: {
            // set any action after present
        })
    }
    
    @objc func pushButtonAction() {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func pushButtonAction2() {
        let detailVC = TableViewController(nibName: "TableViewController", bundle: nil)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: set DataManager String
extension RootViewController {
    func setDataManagerString() {
        let string = "data Manager String"
        let dataManager = DataManager.sharedInstance
        dataManager.setString(text: string)
    }
}
