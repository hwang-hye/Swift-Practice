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
        self.setLeadingPadding(12)
        self.backgroundColor = .black
        self.layer.opacity = 0.7
        
    }
    

    
    // AD Background RandomColor
    func RandomColor() -> UIColor {
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            return color
        }
    
    // UILabel Pharagraph Style Indent
    func setLeadingPadding(_ padding: CGFloat) {
            guard let text = self.text else { return }
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = padding
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            
            self.attributedText = attributedString
        }
}

