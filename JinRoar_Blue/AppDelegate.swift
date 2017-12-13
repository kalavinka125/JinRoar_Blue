//
//  AppDelegate.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/11/29.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit
import MultipeerConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var isFirstBoot:Bool = true
    var window: UIWindow?
    var session : MCSession?
    let descriptionText = ["まず、「狼狂する猜疑心」を別デバイスで起動するがいい。","「狼狂する猜疑心」タイトル画面から「\"隠遁者\"との連携」を押し給え。","さすれば、ブラウザが表示されるであろう。このアプリが入っている端末を選択せよ。","このアプリに接続要請が来るゆえ、許可せよ。","時が経てば次の画面に移るだろう。しばし待たれよ。","連携中はBluetooth/Wi-Fiを使用する。さらに、スリープしない。電池残量には気をつけよ。","このアプリをバックグラウンドに移すとBluetooth/Wi-Fiは切断される。ゆめゆめ忘るることなかれ。"]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //スリープさせない
        UIApplication.shared.isIdleTimerDisabled = true
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

