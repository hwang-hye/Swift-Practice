//
//  ADTableViewCell.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/30/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let identifier = "ADTableViewCell"
    
    @IBOutlet var adLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureLayout()
        
    }

    func configureLayout() {
        
        adLabel.setAdLabel()
        
    }

}
