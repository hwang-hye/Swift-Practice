//
//  EmotionDiaryViewController.swift
//  0518-EmotionDiary
//
//  Created by hwanghye on 5/18/24.
//

import UIKit

class EmotionDiaryViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var labels: [UILabel]!
    
    // Emotion Button
    @IBOutlet var happyEmotionButton: UIButton!
    @IBOutlet var loveEmotionButton: UIButton!
    @IBOutlet var likeEmotionButton: UIButton!
    @IBOutlet var embarrasEmotionButton: UIButton!
    @IBOutlet var upsetEmotionButton: UIButton!
    @IBOutlet var tiredEmotionButton: UIButton!
    @IBOutlet var tenseEmotionButton: UIButton!
    @IBOutlet var sadEmotionButton: UIButton!
    @IBOutlet var randomEmotionButton: UIButton!
    
    // Emotion Label
    @IBOutlet var happyEmotionLabel: UILabel!
    @IBOutlet weak var loveEmotionLabel: UILabel!
    @IBOutlet var likeEmotionLabel: UILabel!
    @IBOutlet var embarrasEmotionLabel: UILabel!
    @IBOutlet var upsetEmotionLabel: UILabel!
    @IBOutlet var tiredEmotionLabel: UILabel!
    @IBOutlet var tenseEmotionLabel: UILabel!
    @IBOutlet var sadEmotionLabel: UILabel!
    @IBOutlet var randomEmotionLabel: UILabel!
    
    // 변수
    let buttonName = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "피곤해", "긴장해", "우울해"]
    var emotionCount = [Int](repeating: 0, count: 8)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        titleNavigationItem.title = "감정 다이어리"
        
        
        // Design LabelUI Setting
        designLabelUI(happyEmotionLabel, text: "행복해")
        designLabelUI(loveEmotionLabel, text: "사랑해")
        designLabelUI(likeEmotionLabel, text: "좋아해")
        designLabelUI(embarrasEmotionLabel, text: "당황함")
        designLabelUI(upsetEmotionLabel, text: "속상해")
        designLabelUI(tiredEmotionLabel, text: "피곤해")
        designLabelUI(tenseEmotionLabel, text: "긴장돼")
        designLabelUI(sadEmotionLabel, text: "우울해")
        designLabelUI(randomEmotionLabel, text: "?")
        
        // Design ButtonUI Setting
        designButtonUI(happyEmotionButton, buttonImage: "slime1")
        designButtonUI(loveEmotionButton, buttonImage: "slime2")
        designButtonUI(likeEmotionButton, buttonImage: "slime3")
        designButtonUI(embarrasEmotionButton, buttonImage: "slime4")
        designButtonUI(upsetEmotionButton, buttonImage: "slime5")
        designButtonUI(tiredEmotionButton, buttonImage: "slime6")
        designButtonUI(tenseEmotionButton, buttonImage: "slime7")
        designButtonUI(sadEmotionButton, buttonImage: "slime9")
        designButtonUI(randomEmotionButton, buttonImage: "slime8")
    }
    
    // Emotion Button Clicked Action
    @IBAction func slimeButtonClicked(_ sender: UIButton) {
        
        let index = buttons.firstIndex(of: sender)!
        
        emotionCount[index] = emotionCount[index] + 1
        
        if emotionCount[index] > 99 {
            emotionCount[index] = 0
        }
        
        labels[index].text = "\(buttonName[index]) \(emotionCount[index])"
        
    }
    
    // Random Button Clicked Action
    @IBAction func randomButtonClicked(_ sender: UIButton) {
        
        let randomNumber = Int.random(in: 0..<100)
        
        randomEmotionLabel.text = String(randomNumber)
        
    }
    
    
    func designLabelUI(_ label: UILabel, text: String) {
        
        label.text = text
        label.textAlignment = .center
        
    }
    
    func designButtonUI(_ button: UIButton, buttonImage: String) {
        
        let emotionButtonImage = UIImage(named: buttonImage)?.withRenderingMode(.alwaysOriginal)
        
        button.setImage(emotionButtonImage, for: .normal)
        
    }
}
