//
//  TopCityViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/30/24.
//

import UIKit

class TopCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var topCityNavigationTiltle: UINavigationItem!
    @IBOutlet var topCityTableView: UITableView!
    @IBOutlet var topCItySegController: UISegmentedControl!
    
    let list = CityInfo.city
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topCityNavigationTiltle.title = "인기 도시"
        topCityTableView.rowHeight = 160
        topCItySegController.setTitle("모두", forSegmentAt: 0)
        topCItySegController.setTitle("국내", forSegmentAt: 1)
        topCItySegController.setTitle("해외", forSegmentAt: 2)
        
        topCityTableView.delegate = self
        topCityTableView.dataSource = self
        
        let xib = UINib(nibName: TopCityTableViewCell.identifier, bundle: nil)
        topCityTableView.register(xib, forCellReuseIdentifier: TopCityTableViewCell.identifier)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TopCityTableViewCell.identifier, for: indexPath) as! TopCityTableViewCell
        
        cell.configureCell(list[indexPath.row])
        
        return cell
    }


}
