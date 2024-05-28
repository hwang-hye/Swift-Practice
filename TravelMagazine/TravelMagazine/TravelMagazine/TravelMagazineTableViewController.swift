//
//  TravelMagazineTableViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/27/24.
//

import UIKit

// Error Massage
// UITableViewDelegate, UITableViewDataSource
// Redundant conformance of 'TravelMagazineTableViewController' to protocol 'UITableViewDelegate'
// Thread 1: "-[UITableViewController loadView] instantiated view controller with identifier \"UIViewController-38G-ha-8WP\" from storyboard \"TravelMagazine\", but didn't get a UITableView."
class TravelMagazineTableViewController: UITableViewController {
    
    @IBOutlet var TravelMagazineTableView: UITableView!

    
    // Dummy Data를 list에 담음
    let list = MagazineInfo.magazine
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Extension에서 내려옴
        configureView("Travel Magazine")
        configureTableView()
        
    }

    
    func configureTableView() {
        
        tableView.rowHeight = 400
        tableView.delegate = self
        tableView.dataSource = self
        
        // Cell 등록
        let xib = UINib(nibName: TravelMagazineTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: TravelMagazineTableViewCell.identifier)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelMagazineTableViewCell.identifier, for: indexPath) as! TravelMagazineTableViewCell
        
        cell.configureCell(list[indexPath.row])
        
        return cell
    }
    

}
