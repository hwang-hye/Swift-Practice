//
//  CityTableViewCell.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/27/24.
//

import UIKit
import Kingfisher


class CityTableViewCell: UITableViewCell {

    // City Cell Outlet
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var citySubtitleLabel: UILabel!
    @IBOutlet var starRatingLabel: UILabel!
    @IBOutlet var favoritesCountLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureLayout()
    }

    // configureLayout
    // extention 으로 구성
    func configureLayout() {
        cityTitleLabel.setTitleLabel()
        citySubtitleLabel.setSubtitleLabl()
        favoritesCountLabel.setInfoLable()
        favoriteButton.setFovoriteButton()
    
    }
    
    // Cell에 어떤 값(data)을 어떻게 담을 것인지
    func configureCell(data: Travel) {
        
        cityTitleLabel.text = data.title
        citySubtitleLabel.text = data.description
        starRatingLabel.text = "☆☆☆☆☆"
        favoritesCountLabel.text = data.save?.formatted()
        
        let defaultImageURL = "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg"
        let url = URL(string: data.travel_image ?? defaultImageURL)
        
        travelImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 8
        
    }
    
    
    @IBAction func favoriteButtonClicked(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        
    }
    
}
