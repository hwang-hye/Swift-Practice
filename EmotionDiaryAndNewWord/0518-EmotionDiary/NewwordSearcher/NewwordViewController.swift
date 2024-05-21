//
//  NewwordViewController.swift
//  0518-EmotionDiary
//
//  Created by hwanghye on 5/19/24.
//

import UIKit

class NewwordViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet var wordTagButtons: [UIButton]!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // 변수
    let newwordTag = ["잼얘", "추구미", "중꺾마", "오운완"]
    let newwordList = [
        "잼얘": "'재밌는 이야기'의 줄임말.",
        "추구미": "'내가 추구하는 이미지'를 줄임말.",
        "중꺾마": "게임 League of Legend 2023Worlds의 우승 선수인 'Deft'의 유행어로 중요한 건 꺾이지 않는 마음'의 줄임말.",
        "오운완": "'오늘 운동 완료'의 줄임말로 오늘 해야할 운동을 모두 마쳤다는 의미.",
        "이왜진": "'이게 왜 진짜임?'의 줄임말로 주로 믿기 어렵거나 가짜라고 생각했던 것들이 진짜일때 사용하는 말."
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Search Text Field UI Setting
        searchTextField.placeholder = " 검색어를 입력하세요"
        searchTextField.frame.size.height = 46
        searchTextField.borderStyle = .line
        searchTextField.layer.borderWidth = 2
        
        // Search Button UI Setting
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        
        for button in wordTagButtons {
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 10
            button.tintColor = .black
        }
        
        for (index, button) in wordTagButtons.enumerated() {
            if index < newwordTag.count {
                button.setTitle(newwordTag[index], for: .normal)
            }
        }
        
        // Result Label UI Setting
        resultLabel.layer.borderWidth = 1
        resultLabel.textAlignment = .center
        resultLabel.text = "검색결과를 보여줍니다"
        resultLabel.numberOfLines = 0
        resultLabel.lineBreakMode = .byWordWrapping
        
    }
    
    
    // Search Button Clicked Action
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        
        let inputText = searchTextField.text!
        searchNewword(inputText: inputText)
    }
    
    // Tag Button Clicked Action
    @IBAction func tagButtonClicked(_ sender: UIButton) {
        
        let inputText = sender.titleLabel!.text!
        searchNewword(inputText: inputText)
        
    }
    
    // Search Function
    @IBAction func searchTextFieldReturn(_ sender: UITextField) {
        
        let inputText = searchTextField.text!
        searchNewword(inputText: inputText)
    }
    
    func searchNewword(inputText: String) {
        if newwordList[inputText] == nil {
            resultLabel.text = "검색결과가 없습니다"
        } else {
            resultLabel.text = newwordList[inputText]
        }
    }
    
    
    // Tap Gesture End Action
    @IBAction func keyboardDissmis(_ sender: Any) {
        view.endEditing(true)
    }
}


