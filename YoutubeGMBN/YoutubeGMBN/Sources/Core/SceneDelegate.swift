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
        let rootViewController = UINavigationController()
        rootViewController.navigationBar.barStyle = .black
        rootViewController.navigationBar.tintColor = .tertiary
        let viewModel = MoviesListViewModel()
        rootViewController.pushViewController(MoviesListViewController(viewModel: viewModel), animated: false)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
