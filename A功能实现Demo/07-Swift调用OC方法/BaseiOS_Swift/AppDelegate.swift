//
//  AppDelegate.swift
//  BaseiOS_Swift
//
//  Created by ruixinyi on 2021/3/13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController.init()
        self.window?.makeKeyAndVisible()
        return true
    }



}

