//
//  UIButton+.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/28/24.
//

import UIKit

extension UIButton {
    
    func setFovorieButton() {
        self.tintColor = .red
        self.setImage(UIImage(systemName: "heart"), for: .normal)
    }
}
