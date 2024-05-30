//
//  UIImageView+.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/31/24.
//

import UIKit


extension UIImageView {
    
    func setTopCityImageView() {
        self.contentMode = .scaleAspectFill
        // 그림자를 표현할 공간이 없는 것 같음
        // UIView로 다시 해보기
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.clipsToBounds = true
        
    }
    
    func setCornerRadius(_ corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(
                roundedRect: self.bounds,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
    
