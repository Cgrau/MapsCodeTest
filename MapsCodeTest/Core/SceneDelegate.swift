//
//  SceneDelegate.swift
//  MapsCodeTest
//
//  Created by Carles Grau on 25/04/2020.
//  Copyright © 2020 Carles Grau. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    let viewController = container.tripListViewController()
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
}
