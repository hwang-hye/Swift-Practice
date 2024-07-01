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
        let contentNav = UINavigationController(rootViewController: contentVC)
        contentVC.tabBarItem = UITabBarItem(title: "영화", image: UIImage(systemName: "movieclapper"), tag: 0)
        
        let searchVC = SearchCollectionViewController()
        let searchNav = UINavigationController(rootViewController: searchVC)
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        let nasaVC = NasaViewController()
        let nasaNav = UINavigationController(rootViewController: nasaVC)
        nasaVC.tabBarItem = UITabBarItem(title: "NASA", image: UIImage(systemName: "star"), tag: 2)

        setViewControllers([contentNav, searchNav, nasaNav], animated: true)
        selectedViewController = contentNav
    }
}
