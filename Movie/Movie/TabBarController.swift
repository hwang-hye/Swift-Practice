//
//  TabBarController.swift
//  Movie
//
//  Created by hwanghye on 6/28/24.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .lightGray
        
        let contentVC = ContentViewController()
        contentVC.tabBarItem = UITabBarItem(title: "영화", image: UIImage(systemName: "movieclapper"), tag: 0)
        
        let searchVC = SearchCollectionViewController()
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        setViewControllers([contentVC, searchVC], animated: true)
        selectedViewController = contentVC
    }
}
