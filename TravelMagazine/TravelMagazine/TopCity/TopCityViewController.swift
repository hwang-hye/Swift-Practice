//
//  TopCityViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/30/24.
//

import UIKit

class TopCityViewController: UIViewController {
    
    @IBOutlet var topCityNavigationTiltle: UINavigationItem!
    @IBOutlet var topCityTableView: UITableView!
    @IBOutlet var topCitySegController: UISegmentedControl!
    
    var totalList: [City] = CityInfo.city // 전체 데이터 리스트
    var filteredList: [City] = [] // 필터링된 데이터 리스트
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topCityNavigationTiltle.title = "인기 도시"
        topCityTableView.rowHeight = 160
        topCitySegController.setTitle("모두", forSegmentAt: 0)
        topCitySegController.setTitle("국내", forSegmentAt: 1)
        topCitySegController.setTitle("해외", forSegmentAt: 2)
        
        topCityTableView.delegate = self
        topCityTableView.dataSource = self
        
        let xib = UINib(nibName: TopCityTableViewCell.identifier, bundle: nil)
        topCityTableView.register(xib, forCellReuseIdentifier: TopCityTableViewCell.identifier)
        
        configureSegmentedControl()
        filterData()
    }
    
    func configureSegmentedControl() {
        topCitySegController.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    @objc
    func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        filterData()
    }

    func filterData() {
        switch topCitySegController.selectedSegmentIndex {
        case 1:
            // Domestic
            filteredList = totalList.filter { $0.domestic_travel }
        case 2:
            // International
            filteredList = totalList.filter { !$0.domestic_travel }
        default:
            // All
            filteredList = totalList
        }
        topCityTableView.reloadData()
    }
}


extension TopCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredList.count
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopCityTableViewCell.identifier, for: indexPath) as! TopCityTableViewCell
        
        let data = filteredList[indexPath.row]
        cell.configureCell(data)
        
        return cell
    }
}
