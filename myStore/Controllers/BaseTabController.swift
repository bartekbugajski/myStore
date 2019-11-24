//
//  BaseTabBarController.swift
//  larvApps
//
//  Created by Bartek Bugajski on 30/07/2019.
//  Copyright © 2019 BB. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    // 3 - maybe introduce our AppsSearchController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: ItemsSearchController(), title: "Create", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps"),
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
        
    }
    
}
