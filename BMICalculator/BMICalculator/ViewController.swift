//
//  ViewController.swift
//  BMICalculator
//
//  Created by hwanghye on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    // UILabel
    @IBOutlet var bmiTitleLabel: UILabel!
    @IBOutlet var bmiTextLabel: UILabel!
    
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    
    // ImageView
    @IBOutlet var bmiImageView: UIImageView!
    
    // UITextField
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    // UIButton
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var randomCalulateButton: UIButton!
    
    @IBOutlet var resultButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label UI Setting
        designedLabelUI(bmiTitleLabel, text: "BMI Calculator", fontSize: 24, weight: .heavy)
        designedLabelUI(bmiTextLabel, text: "당신의 BMI 지수를\n알려드릴게요", fontSize: 15, weight: .light)
        bmiTextLabel.numberOfLines = 2
        
        designedLabelUI(nicknameLabel, text: "닉네임을 입력해주세요", fontSize: 15, weight: .medium)
        designedLabelUI(heightLabel, text: "키가 어떻게 되시나요?", fontSize: 15, weight: .medium)
        designedLabelUI(weightLabel, text: "몸무게가 어떻게 되시나요?", fontSize: 15, weight: .medium)
        
        // Button UI Setting
        designedButton(resetButton, text: "리셋하기", fontSize: 12, textColor: .red)
        designedButton(randomCalulateButton, text: "랜덤으로 BMI 계산하기", fontSize: 12, textColor: .purple)
        
        designedButton(resultButton, text: "결과 확인", fontSize: 20, textColor: .white, backgroundColor: .purple, radius: 8)
        
        // Image Setting
        bmiImageView.image = UIImage(named: "image")
        
        // Text Field Setting
        designedTextField(nicknameTextField, keyBoardType: .default)
        designedTextField(heightTextField, keyBoardType: .numberPad)
        designedTextField(weightTextField, keyBoardType: .numberPad)

    }
    
    
    // UI Design Function
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
    

    // BMI Calculator
    func bmiCalculate() -> String {
        
        let randomWeight = Double.random(in: 40.0...150.0)
        let randomHeight = Double.random(in: 100.0...200.0)
        
        let userWeight = Double( weightTextField.text ?? "") ?? randomWeight
        let userHeight = Double( heightTextField.text ?? "") ?? randomHeight
        let userHeightCm = userHeight / 100
        let result = (userWeight / (userHeightCm * userHeightCm))
        let bmi = String(format: "%.1f", result)
        
        return bmi
        
    }
    
    
    // Random BMI Event
    @IBAction func randomBmiButtonClicked(_ sender: UIButton) {
        
        resultButtonClicked(sender)
        
    }
    
    
    // BMI Result Action
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        
        let bmiResult = bmiCalculate()
    
        let alert = UIAlertController(
            title: "BMI 결과",
            message: "BMI는 \(bmiResult)입니다",
            preferredStyle: .alert
        )
        
        let check = UIAlertAction(
            title: "확인",
            style: .cancel
        )
        
        alert.addAction(check)
        
        present(alert, animated: true)

    }
    
    
    // Tap Gesture End Action
    @IBAction func keyboardDismiss(_ sender: Any) {
        
        view.endEditing(true)
        
    }
    
}
