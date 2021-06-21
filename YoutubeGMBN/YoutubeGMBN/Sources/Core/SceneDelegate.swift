//
//  SceneDelegate.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = prepareRoot()
        window?.makeKeyAndVisible()
    }
    
    private func prepareRoot() -> UIViewController {
        let rootViewController = UINavigationController()
        rootViewController.navigationBar.barStyle = .black
        rootViewController.navigationBar.tintColor = .tertiary
        rootViewController.pushViewController(MoviesListViewControllerFactory.create(), animated: false)
        return rootViewController
    }
}
