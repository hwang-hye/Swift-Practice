//
//  LottoViewController.swift
//  OpenAPI-Practice
//
//  Created by hwanghye on 6/6/24.
//

import UIKit
import SnapKit

class LottoViewController: UIViewController {
    
    let picker = UIPickerView()
    
    let searchTextField = UITextField()
    let infoTextLabel = UILabel()
    let infoDateLabel = UILabel()
    let infoResultLabel = UILabel()
    
    let fistNumberResultLabel = UILabel()
    let secondNumberResultLabel = UILabel()
    let thirdNumberResultLabel = UILabel()
    let fourthNumberResultLabel = UILabel()
    let fifthNumberResultLabel = UILabel()
    let sixthNumberResultLabel = UILabel()
    let seventhNumberResultLabel = UILabel()
    
    let plusTextLabel = UILabel()
    let bonusTextLabel = UILabel()
    
    let lottoBallStackView = UIStackView()
    var lottoBalls: [UITextField] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        picker.delegate = self
        //        picker.dataSource = self
        searchTextField.inputView = picker
        
        configureHierarchy()
        configureLayout()
        configureUI()
        // callRequest()
        
        for _ in 0..<8 {
            let lottoBall = UITextField()
            
            lottoBall.text = "00"
            lottoBall.textAlignment = .center
            lottoBall.backgroundColor = .orange
            lottoBall.font = .systemFont(ofSize: 16, weight: .bold)
            lottoBall.textColor = .white
            
            lottoBalls.append(lottoBall)
            lottoBallStackView.addArrangedSubview(lottoBall)
            
            lottoBall.snp.makeConstraints { make in
                make.height.equalTo(lottoBall.snp.width)
                make.width.equalTo(40)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // lottoBall 모든 텍스트 필드의 cornerRadius를 동일하게 설정
        for lottoBall in lottoBalls {
            lottoBall.layer.cornerRadius = lottoBall.frame.height / 2
            lottoBall.layer.masksToBounds = true
        }
        
        // lottoBall 특정 인덱스의 스타일 변경
        if lottoBalls.count > 6 {
            let plusTextField = lottoBalls[6]
            plusTextField.backgroundColor = .none
            plusTextField.text = "+"
            plusTextField.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            plusTextField.textColor = .black
        }
    }
    
    
    func configureHierarchy() {
        view.addSubview(picker)
        view.addSubview(searchTextField)
        view.addSubview(infoTextLabel)
        view.addSubview(infoDateLabel)
        view.addSubview(infoResultLabel)
        view.addSubview(fistNumberResultLabel)
        view.addSubview(secondNumberResultLabel)
        view.addSubview(thirdNumberResultLabel)
        view.addSubview(fourthNumberResultLabel)
        view.addSubview(sixthNumberResultLabel)
        view.addSubview(seventhNumberResultLabel)
        view.addSubview(plusTextLabel)
        view.addSubview(bonusTextLabel)
        view.addSubview(lottoBallStackView)
    }
    
    func configureLayout() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
        
        infoTextLabel.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
        
        infoDateLabel.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        infoResultLabel.snp.makeConstraints { make in
            make.top.equalTo(infoTextLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
        
        lottoBallStackView.snp.makeConstraints { make in
            make.top.equalTo(infoResultLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        searchTextField.borderStyle = .roundedRect
        searchTextField.placeholder = "회차를 입력하세요"
        
        infoTextLabel.text = "당첨번호 안내"
        
        infoDateLabel.text = "2020-05-30 추첨"
        infoDateLabel.textColor = .gray
        
        infoResultLabel.text = "913회 당첨결과"
        infoResultLabel.textAlignment = .center
        infoResultLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        
        fistNumberResultLabel.text = "6"
        fistNumberResultLabel.backgroundColor = .yellow
        
        secondNumberResultLabel.text = "14"
        secondNumberResultLabel.backgroundColor = .cyan
        
        thirdNumberResultLabel.text = "16"
        thirdNumberResultLabel.backgroundColor = .cyan
        
        lottoBallStackView.axis = .horizontal
        lottoBallStackView.alignment = .fill
        lottoBallStackView.distribution = .fillEqually
        lottoBallStackView.spacing = 10
    }
}
