//
//  AppDelegate.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 05/01/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = PerbandinganViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }

}

