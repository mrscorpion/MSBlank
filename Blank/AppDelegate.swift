//
//  AppDelegate.swift
//  Blank
//
//  Created by Mr.Scorpion on 7/24/15.
//  Copyright (c) 2015 Mr.Scorpion. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        AVOSCloud.setApplicationId("2g4wnyuewo0qv3g9ou6dxm37olun4ztnknm3th1zoiokouih", clientKey: "bkpgcz5g37znl8pcbii6ihhqbn7dx1ajk7p9ctcq6wemhi9g")
//        AVOSCloud.setApplicationId("Er3SQE4bcPStIxPCp66p4fXn-gzGzoHsz", clientKey: "NG83rPYUsU4Ib5f7c2IlghHh")

        //MARK - 侧滑菜单
        let tabVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("blankTabBarController") as! UITabBarController
        let slideVC = MSSlideViewController(nibName: "MSSlideViewController", bundle: nil)
        
        let slideMenuVC = RESideMenu(contentViewController: tabVC, leftMenuViewController: slideVC, rightMenuViewController: nil)
        slideMenuVC.contentViewShadowEnabled = true
        slideMenuVC.contentViewInPortraitOffsetCenterX = -MSTool.ScreenW * 0.2
        slideMenuVC.backgroundImage = UIImage(named: "SlideMenuBG2")
        slideMenuVC.leftMenuViewController.view.backgroundColor = UIColor.clearColor()
        
        self.window?.rootViewController = slideMenuVC
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

