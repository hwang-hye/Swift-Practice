//
//  ViewController.swift
//  BMICalculator
//
//  Created by hwanghye on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var bmiTitleLabel: UILabel!
    @IBOutlet var bmiTextLabel: UILabel!
    
    @IBOutlet var bmiImageView: UIImageView!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    
    
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var randomCalulateButton: UIButton!
    
    @IBOutlet var resultButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label UI Setting
        designedLabelUI(bmiTitleLabel, text: "BMI Calculator", fontSize: 24, weight: .heavy)
        designedLabelUI(bmiTextLabel, text: "당신의 BMI 지수를\n알려드릴게요", fontSize: 15, weight: .light)
        bmiTextLabel.numberOfLines = 2
        designedLabelUI(heightLabel, text: "키가 어떻게 되시나요?", fontSize: 15, weight: .medium)
        designedLabelUI(weightLabel, text: "몸무게가 어떻게 되시나요?", fontSize: 15, weight: .regular)
        
        // Button UI Setting
        designedButton(randomCalulateButton, text: "랜덤으로 BMI 계산하기", fontSize: 12, textColor: .purple)
        
        designedButton(resultButton, text: "결과 확인", fontSize: 20, textColor: .white, backgroundColor: .purple, radius: 8)
        
        // Image Setting
        bmiImageView.image = UIImage(named: "image")
        
        // Text Field Setting
        designedTextField(heightTextField, keyBoardType: .numberPad)
        designedTextField(weightTextField, keyBoardType: .numberPad)

    }
    
    // UI Design Funtion
    func designedLabelUI(_ label: UILabel, text: String, fontSize: CGFloat, weight: UIFont.Weight) {
        
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        
    }
    
    func designedButton(_ button: UIButton, text: String, fontSize: CGFloat, textColor: UIColor, backgroundColor: UIColor = .white, radius: CGFloat = 0) {
        
        button.setTitle(text, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: fontSize)
        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = radius
        
    }
    
    func designedTextField (_ textField: UITextField, borderRadius radius: CGFloat = 8, keyBoardType type: UIKeyboardType) {
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = radius
        textField.keyboardType = type
    }
    
    // Tap Gesture End Action
    @IBAction func keyboardDismiss(_ sender: Any) {
        
        view.endEditing(true)
        
    }
    
}
