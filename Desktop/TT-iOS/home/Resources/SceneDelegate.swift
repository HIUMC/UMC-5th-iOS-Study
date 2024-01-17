//
//  SceneDelegate.swift
//  TT
//
//  Created by 오연서 on 1/12/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene) // SceneDelegate의 프로퍼티에 설정해줌
        let mainViewController = HomeViewController() // 맨 처음 보여줄 ViewController
        
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        let firstViewController = UINavigationController(rootViewController: HomeViewController())//ListViewController() 로 수정
        let secondViewController = UINavigationController(rootViewController: HomeViewController())//ListViewController() 로 수정
        let thirdViewController = UINavigationController(rootViewController: HomeViewController())//ListViewController() 로 수정
        let fourthViewController = UINavigationController(rootViewController: HomeViewController())
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstViewController, secondViewController, thirdViewController, fourthViewController], animated: true)
        tabBarController.tabBar.backgroundColor = .white
        
        if let items = tabBarController.tabBar.items {
            if let mainColor = UIColor(named: "활성화 테두리"){
                let iconSize = CGSize(width: 25, height: 25) // 원하는 이미지 크기
                let configuration = UIImage.SymbolConfiguration(pointSize: iconSize.width, weight: .medium)
                
                items[0].selectedImage = UIImage(named: "icon_home")?.withTintColor(mainColor, renderingMode: .alwaysOriginal)
                items[0].image = UIImage(named: "icon_home")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
                items[0].title = "홈"
                items[0].setTitleTextAttributes([.foregroundColor: mainColor], for: .selected)
                
                items[1].selectedImage = UIImage(named: "icon_team")?.withTintColor(mainColor, renderingMode: .alwaysOriginal)
                items[1].image = UIImage(named: "icon_team")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
                items[1].title = "팀"
                items[1].setTitleTextAttributes([.foregroundColor: mainColor], for: .selected)
                
                items[2].selectedImage = UIImage(named: "icon_calendar")?.withTintColor(mainColor, renderingMode: .alwaysOriginal)
                items[2].image = UIImage(named: "icon_calendar")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
                items[2].title = "캘린더"
                items[2].setTitleTextAttributes([.foregroundColor: mainColor], for: .selected)
                
                items[3].selectedImage = UIImage(named: "icon_my")?.withTintColor(mainColor, renderingMode: .alwaysOriginal)
                items[3].image = UIImage(named: "icon_my")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
                items[3].title = "마이"
                items[3].setTitleTextAttributes([.foregroundColor: mainColor], for: .selected)
                
            }
        }
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
}

func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}




