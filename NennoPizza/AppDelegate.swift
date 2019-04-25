//
//  AppDelegate.swift
//  NennoPizza
//
//  Created by Maxim Ohrimenko on 4/25/19.
//  Copyright © 2019 Com. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        adjustUI()
        return true
    }
    
    private func adjustUI() {
        UINavigationBar.appearance().tintColor = AppConstants.defaultColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : AppConstants.defaultColor]
    }
}

