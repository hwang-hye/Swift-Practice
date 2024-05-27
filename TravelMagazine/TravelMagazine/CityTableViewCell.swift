//
//  CityTableViewCell.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/27/24.
//

import UIKit
import Kingfisher



class CityTableViewCell: UITableViewCell {

    // City
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

    // configureLayout 정의?
    // extention 가지고 와서 사용
    func configureLayout() {
        cityTitleLabel.setTitleLabel()
        citySubtitleLabel.setSubtitleLabl()
        favoritesCountLabel.setFavoriteCountLable()
        favoriteButton.setFovorieButton()
    
    }
    
    
    func configureCell(data: Travel) {
        
        cityTitleLabel.text = data.title
        citySubtitleLabel.text = data.description
        favoritesCountLabel.text = data.save?.formatted()
        
        let defaultImageURL = "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg"
        let url = URL(string: data.travel_image ?? defaultImageURL)
        
        travelImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        travelImageView.contentMode = .scaleAspectFill
        
    }
    
}
