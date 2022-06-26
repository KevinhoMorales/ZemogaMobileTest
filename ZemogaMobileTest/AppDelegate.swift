//
//  AppDelegate.swift
//  ZemogaMobileTest
//
//  Created by Kevinho Morales on 26/6/22.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let coordinator = MainCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpInitView()
        return true
    }
    
    private func setUpInitView() {
        coordinator.welcomeView()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator.navigationController
        coordinator.navigationController.navigationBar.prefersLargeTitles = false
        window?.makeKeyAndVisible()
    }
    
}

