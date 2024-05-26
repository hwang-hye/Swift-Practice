//
//  TravelMagazineTableViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/27/24.
//

import UIKit

struct MagazineInfo {
    let title: String
    let subtitle: String
    let photoImage: String
    let link: String
    let date: String
}

class TravelMagazineTableViewController: UITableViewController {
    
    
    @IBOutlet var titleNavigation: UINavigationItem!
    
    var magazineContentList: [MagazineInfo] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleNavigation.title = "TRAVEL MAGAZINE"
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return magazineContentList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCell", for: indexPath) as! ContentTableViewCell
        
        
        cell.contentTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .black)
        cell.contentTitleLabel.numberOfLines = 2
        cell.contentSubtitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        cell.contentSubtitleLabel.textColor = .lightGray
        cell.contentDateLabel.textAlignment = .right
        cell.contentDateLabel.textColor = .lightGray
        
        return cell
    }
    

}
