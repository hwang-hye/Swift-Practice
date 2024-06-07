//
//  LottoViewController.swift
//  OpenAPI-Practice
//
//  Created by hwanghye on 6/6/24.
//

import UIKit
import Alamofire
import SnapKit

struct Lotto: Decodable {
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    let drwNo: Int // 로또회차
}


class LottoViewController: UIViewController {
    
    let picker = UIPickerView()
    var pickerData: [String] = []
    var selectedValue: String?
    
    let searchTextField = UITextField()
    let infoTextLabel = UILabel()
    let infoDateLabel = UILabel()
    let infoResultLabel = UILabel()
    
    let bonusTextLabel = UILabel()
    
    let lottoBallStackView = UIStackView()
    var lottoBalls: [UITextField] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPicker))
        view.addGestureRecognizer(tapGesture)

        
        searchTextField.inputView = picker
        picker.delegate = self
        picker.dataSource = self
        searchTextField.delegate = self
        
        configureHierarchy()
        configureLayout()
        configureUI()
        configurePickerData()
        
        // lottoBall UI
        for _ in 0..<8 {
            let lottoBall = UITextField()
            
            lottoBall.text = ""
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
    
    func callRequest(_ value: String?) {
        
        guard value != nil else { return }
        
        let url = "\(APIURL.lottoURL)\(searchTextField.text!)"
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.infoDateLabel.text = "\(value.drwNoDate) 추첨"
                self.infoResultLabel.text = "\(value.drwNo)회 당첨결과"
                
                // lottoBall 번호를 textField에 할당
                let numbers = [value.drwtNo1, value.drwtNo2, value.drwtNo3, value.drwtNo4, value.drwtNo5, value.drwtNo6, -1, value.bnusNo]
                
                for (index, lottoBall) in self.lottoBalls.enumerated() {
                    if index == 6 {
                        // "+" 표시를 유지
                        lottoBall.text = "+"
                    } else {
                        lottoBall.text = "\(numbers[index])"
                    }
                }
                
            case .failure(let error):
                self.searchTextField.placeholder = "올바른 회차를 입력하세요"
            }
        }
    }
    
    
    @objc func dismissPicker() { view.endEditing(true) }
    
    
    func configureHierarchy() {
        view.addSubview(searchTextField)
        view.addSubview(infoTextLabel)
        view.addSubview(infoDateLabel)
        view.addSubview(infoResultLabel)
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
        
        infoDateLabel.textColor = .gray
        
        infoResultLabel.text = "당첨결과"
        infoResultLabel.textAlignment = .center
        infoResultLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        
        lottoBallStackView.axis = .horizontal
        lottoBallStackView.alignment = .fill
        lottoBallStackView.distribution = .fillEqually
        lottoBallStackView.spacing = 10
    }
    
    func configurePickerData() {
        let range = (1...1122).reversed()
        pickerData = range.map { String($0) }
        picker.reloadAllComponents()
        
        // PickerView의 초기 선택 값을 설정
        searchTextField.text = pickerData[0]
        selectedValue = pickerData[0]
        
        callRequest(selectedValue)
    }
}


extension LottoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}


extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        searchTextField.text = pickerData[row]
        selectedValue = pickerData[row]
        callRequest(selectedValue)
        print("select", component, row)
    }
}
