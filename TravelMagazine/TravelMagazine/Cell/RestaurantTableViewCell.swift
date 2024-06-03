//
//  RestaurantTableViewCell.swift
//  TravelMagazine
//
//  Created by hwanghye on 6/3/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewCell: UITableViewCell {
    
    static let identifier = "RestaurantTableViewCell"

    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantLikeButton: UIButton!
    
    @IBOutlet var restaurantTitleLabel: UILabel!
    @IBOutlet var restaurantAddressLabel: UILabel!
    @IBOutlet var restaurantNumber: UILabel!
    @IBOutlet var restaurantPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }

    func configureLayout() {
        restaurantTitleLabel.setTitleLabel()
        restaurantAddressLabel.setSubtitleLabl()
        restaurantPriceLabel.setSubtitleLabl()
        restaurantNumber.setSubtitleLabl()
        restaurantImageView.setRestaurantImageView()
        restaurantLikeButton.setLikeButton()
    }
    
    func configureCell(_ data: Restaurant) {
        restaurantTitleLabel.text = data.name
        restaurantAddressLabel.text = data.address
        restaurantNumber.text = data.phoneNumber
        restaurantPriceLabel.text = String(data.price)
        
        let url = URL(string: data.image)
        restaurantImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "fork.knife.circle.fill"))
    }
    
    
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        
    }
    
    
}
