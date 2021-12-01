//
//  CustomTableViewCell.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 11/11/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    //FIXME: try to add a imageView on left of cell
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        self.nameLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        self.nameLabel.textColor = .red
    }

    func configCell(name: String?, number: String?, photo: String?) {
        self.nameLabel.text = name
    }
    
}
