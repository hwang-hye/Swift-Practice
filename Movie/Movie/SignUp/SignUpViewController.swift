//
//  SignUpViewController.swift
//  Movie
//
//  Created by hwanghye on 6/4/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    let signUpTitleLabel = UILabel()
    let signUpidentifierTextField = UITextField()
    let signUpPasswordTextField = UITextField()
    let signUpNicknameTextField = UITextField()
    let signUpAddressTextField = UITextField()
    let signUpReferralcodeTextField = UITextField()
    let signUpButton = UIButton()
    let signUpInfoLable = UILabel()
    let signUpInfoSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    func configureHierarchy() {
        
        view.addSubview(signUpTitleLabel)
        view.addSubview(signUpidentifierTextField)
        view.addSubview(signUpPasswordTextField)
        view.addSubview(signUpNicknameTextField)
        view.addSubview(signUpAddressTextField)
        view.addSubview(signUpReferralcodeTextField)
        view.addSubview(signUpButton)
        view.addSubview(signUpInfoLable)
        view.addSubview(signUpInfoSwitch)
        
    }

    func configureLayout() {
        signUpTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(80)
        }
        
        signUpidentifierTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpTitleLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        
        signUpPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpidentifierTextField.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        
        signUpNicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpPasswordTextField.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        
        signUpAddressTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpNicknameTextField.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        
        signUpReferralcodeTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpAddressTextField.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signUpReferralcodeTextField.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(48)
        }
        
        signUpInfoLable.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(14)
            make.leading.equalTo(20)
        }
        
        signUpInfoSwitch.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(12)
            make.trailing.equalTo(-20)
        }
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        
        signUpTitleLabel.text = "MOVIE APP"
        signUpTitleLabel.textAlignment = .center
        signUpTitleLabel.font = .systemFont(ofSize: 40, weight: .heavy)
        signUpTitleLabel.textColor = .red
    
        signUpidentifierTextField.setTextField("이메일 또는 전화번호")
        signUpPasswordTextField.setTextField("비밀번호")
        signUpPasswordTextField.keyboardType = .numberPad
        signUpPasswordTextField.isSecureTextEntry = true

        signUpNicknameTextField.setTextField("닉네임")
        signUpAddressTextField.setTextField("주소")
        signUpReferralcodeTextField.setTextField("추천 코드 입력")
        
        signUpButton.backgroundColor = .white
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.setTitleColor(.darkGray, for: .highlighted)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        signUpButton.layer.cornerRadius = 6
        
        signUpInfoLable.text = "추가 정보 입력"
        signUpInfoLable.textColor = .white
        signUpInfoLable.textAlignment = .left
        signUpInfoLable.font = .systemFont(ofSize: 14, weight: .regular)
        
        signUpInfoSwitch.onTintColor = .red
    }
    
    @objc func signUpButtonClicked() {
        let vc = SearchCollectionViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}


extension UITextField {
    
    func setTextField(_ title: String) {
        self.textAlignment = .center
        self.backgroundColor = .gray
        self.layer.cornerRadius = 6
        self.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
}
