//
//  TopCityTableViewCell.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/30/24.
//

import UIKit
import Kingfisher


class TopCityTableViewCell: UITableViewCell {
    
    static let identifier = "TopCityTableViewCell"
    

    @IBOutlet var topCityTitleLabel: UILabel!
    @IBOutlet var topCitySubtitleLabel: UILabel!
    @IBOutlet var topCityImageView: UIImageView!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        configureLayout()
                    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        topCityImageView.setCornerRadius([.topLeft, .bottomRight], radius: 16)

    }
    
    
    func configureLayout() {
        topCityTitleLabel.setTopCityTitleLabel()
        topCitySubtitleLabel.setTopCitySubtitleLabel()
        topCityImageView.setTopCityImageView()

    }

    
    func configureCell(_ data: City) {
        
        topCityTitleLabel.text = "\(data.city_name) | \(data.city_english_name)"
        topCitySubtitleLabel.text = "\(data.city_explain)"
        
        let url = URL(string: data.city_image)
        topCityImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))

    }
    
}
