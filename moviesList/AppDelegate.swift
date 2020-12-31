//
//  AppDelegate.swift
//  moviesList
//
//  Created by Sagar Gawande on 30/12/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator : AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start()
        self.appCoordinator = appCoordinator
        return true
    }
}

