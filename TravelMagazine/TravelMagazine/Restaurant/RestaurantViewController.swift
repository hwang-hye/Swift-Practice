//
//  RestaurantViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 6/3/24.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var restaurantTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var list = RestaurantList.restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        let map = UIBarButtonItem(title: "지도", style: .plain, target: self, action: #selector(mapButtonClicked))
        navigationItem.leftBarButtonItem = map
    }
    
    func configureTableView() {
        restaurantTableView.rowHeight = 120
        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        
        let xib = UINib(nibName: RestaurantTableViewCell.identifier, bundle: nil)
        restaurantTableView.register(xib, forCellReuseIdentifier: RestaurantTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.configureCell(list[indexPath.row])
        
        return cell
    }
    
    @objc func mapButtonClicked() {
        let sb = UIStoryboard(name: "Restaurant", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: MapViewController.identifier) as! MapViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return list.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier, for: indexPath) as! RestaurantTableViewCell
//        
//        let data = list[indexPath.row]
//        
//        return cell
//    }
//    
//    
//}
