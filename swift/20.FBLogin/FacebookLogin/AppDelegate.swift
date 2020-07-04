//
//  AppDelegate.swift
//  FacebookLogin
//
//  Created by 小俣圭佑 on 2020/06/13.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //Facebookログイン
        FirebaseApp.configue()
        application.shared.application(application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    //Facebookログイン
    func application(_ application: UIApplication,open url: URL,sourceApplication: String?,annotation: Any) -> Bool {
        return ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    //Facebookログイン
    func applicationDidBecomeActive(_ application: UIApplication) {
        AppEvents.activateApp()
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

