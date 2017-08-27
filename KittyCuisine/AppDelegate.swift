//
//  AppDelegate.swift
//  KittyCuisine
//
//  Created by 吴君恺 on 2017/8/27.
//  Copyright © 2017年 WJK. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
        -> Bool {
        
        guard let rootVC = window?.rootViewController as? DrawerContainerController,
            let storyboard = rootVC.storyboard else {
            fatalError("wrong VC hierarchy")
        }
        
        let drawer = storyboard.instantiateViewController(withIdentifier: "drawerVC")
        let desk = storyboard.instantiateViewController(withIdentifier: "mainNavigationVC")
        rootVC.deskViewController = desk
        rootVC.drawerViewController = drawer
        
        return true
    }
}

