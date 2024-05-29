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
}
