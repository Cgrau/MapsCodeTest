//
//  AppDelegate.swift
//  MapsCodeTest
//
//  Created by Carles Grau on 25/04/2020.
//  Copyright © 2020 Carles Grau. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    registerForPushNotifications()
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  private func registerForPushNotifications() {
    UNUserNotificationCenter.current()
      .requestAuthorization(options: [.alert, .sound, .badge]) {
        granted, _ in
        print("Permission granted: \(granted)")
    }
  }
}
