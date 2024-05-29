//
//  TravelMagazineTableViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/27/24.
//

import UIKit


class TravelMagazineTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        
        TravelMagazineTableView.rowHeight = 500
        TravelMagazineTableView.delegate = self
        TravelMagazineTableView.dataSource = self
        
        // Cell 등록
        let xib = UINib(nibName: TravelMagazineTableViewCell.identifier, bundle: nil)
        TravelMagazineTableView.register(xib, forCellReuseIdentifier: TravelMagazineTableViewCell.identifier)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelMagazineTableViewCell.identifier, for: indexPath) as! TravelMagazineTableViewCell
        
        cell.configureCell(list[indexPath.row])
        
        return cell
    }
}
