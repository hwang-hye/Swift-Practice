//
//  UILabel+.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/28/24.
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
    
    func setInfoLable() {
        self.font = .boldSystemFont(ofSize: 10)
        self.textAlignment = .left
        self.textColor = .gray
    }
    
    func setAdLabel() {
        self.font = .boldSystemFont(ofSize: 20)
        self.textAlignment = .center
        self.backgroundColor = RandomColor()
    }
    
    func setDateLabel() {
        self.font = .systemFont(ofSize: 12)
        self.textAlignment = .right
        self.textColor = .darkGray
    }
    
    func setTopCityTitleLabel() {
        self.font = .boldSystemFont(ofSize: 24)
        self.textColor = .white
        self.textAlignment = .right
    }
    
    func setTopCitySubtitleLabel() {
        
        self.font = .systemFont(ofSize: 16)
        self.textColor = .white
        self.textAlignment = .left
        
    }
    

    
    // AD Background RandomColor
    func RandomColor() -> UIColor {
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            return color
        }
}

