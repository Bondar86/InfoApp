//
//  MainTabBarController.swift
//  InfoApp
//
//  Created by Иван Бондаренко on 06.09.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar()
    }
    
    private func tabBar() {
        viewControllers = [
            firstVC(
                viewController: FirstSceneViewController(),
                image: UIImage(systemName: "folder")),
            firstVC(
                viewController: SecondSceneViewController(),
                image: UIImage(systemName: "folder")),
            firstVC(
                viewController: ThirdSceneViewController(),
                image: UIImage(systemName: "folder"))
        ]
    }
    
    private func firstVC(
        viewController: UIViewController,
        image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
}
