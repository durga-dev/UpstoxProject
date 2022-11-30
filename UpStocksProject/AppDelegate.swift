//
//  AppDelegate.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let homeViewController = HomeViewController(homeViewModel: HomeViewModel())
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()
        return true
    }
    
    
}

