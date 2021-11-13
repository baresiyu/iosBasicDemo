//
//  AppDelegate.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 18/10/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

//import Lib
import UIKit

//mean Entry file
@UIApplicationMain

//class Name: inherit class name, ProtocolName
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //glabol variable of this class
    var window: UIWindow?
    
    //call back when app launch
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // init main UIwindow
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // init our root view controller
        let rootVC = RootViewController(nibName: "RootViewController", bundle: nil)
        
        //init a navigation controller and set our root VC of it
        let nav = UINavigationController(rootViewController: rootVC)
        
        //set our main window rootViewController
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        //return this func param
        return true
    }

}

