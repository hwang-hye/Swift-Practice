//
//  UIButton+.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/28/24.
//

import UIKit

extension UIButton {
    
    func setFovoriteButton() {
        self.tintColor = .red
        
        self.setImage(UIImage(systemName: "heart"), for: .normal)
        self.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    
    func setLikeButton() {
        self.tintColor = .yellow
        
        self.setImage(UIImage(systemName: "star"), for: .normal)
        self.setImage(UIImage(systemName: "star.fill"), for: .selected)
    }
}
