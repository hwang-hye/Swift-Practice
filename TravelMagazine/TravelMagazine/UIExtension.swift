//
//  UIExtension.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/27/24.
//

import UIKit


extension UILabel {
    
    func setTitleLabel() {
        self.font = .boldSystemFont(ofSize: 16)
        self.textAlignment = .left
        self.textColor = .black
    }
    
    func setSubtitleLabl() {
        self.font = .boldSystemFont(ofSize: 14)
        self.textAlignment = .left
        self.textColor = .darkGray

    }
    
    func setFavoriteCountLable() {
        self.font = .boldSystemFont(ofSize: 10)
        self.textAlignment = .left
        self.textColor = .gray
    }
    
}

extension UIButton {
    
    func setFovorieButton() {
        self.tintColor = .red
        self.setImage(UIImage(systemName: "heart"), for: .normal)
    }
}
