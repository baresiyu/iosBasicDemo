//
//  DataManager.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 22/10/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

import UIKit

open class DataManager {
    // Singleton
    static let sharedInstance = DataManager()
    
    // stored variable
    fileprivate var dataString: String?
}

extension DataManager {
    func setString(text: String) {
        self.dataString = text
    }
    
    func getString() -> String? {
        return self.dataString
    }
}
