//
//  HomeViewController.swift
//  Movie
//
//  Created by hwanghye on 6/5/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let UserNicknameLabel = UILabel()
    let mainContentImageView = UIImageView()
    let mainContentLable = UILabel()
    let mainContentPlayButton = UIButton()
    let mainContentBookmarkButton = UIButton()
    let subcontentTitleLabel = UILabel()
    let subcontentFirstImageView = UIImageView()
    let subcontentSecondImageView = UIImageView()
    let subcontentThirdImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()

    }
    
    func configureHierarchy() {
        view.addSubview(UserNicknameLabel)
        view.addSubview(mainContentImageView)
        mainContentImageView.addSubview(mainContentLable)
        mainContentImageView.addSubview(mainContentPlayButton)
        mainContentImageView.addSubview(mainContentBookmarkButton)
        view.addSubview(subcontentTitleLabel)
        view.addSubview(subcontentFirstImageView)
        view.addSubview(subcontentSecondImageView)
        view.addSubview(subcontentThirdImageView)
    }
    
    func configureLayout() {
        UserNicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(44)
        }
        
        mainContentImageView.snp.makeConstraints { make in
            make.top.equalTo(UserNicknameLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(440)
        }
        
        mainContentPlayButton.snp.makeConstraints { make in
            make.bottom.equalTo(mainContentImageView.snp.bottom).inset(14)
            make.leading.equalTo(14)
            make.trailing.equalTo(mainContentImageView.snp.trailing).inset(14)
            make.height.equalTo(44)
        }
        
        mainContentLable.snp.makeConstraints { make in
            make.bottom.equalTo(mainContentPlayButton.snp.top).inset(-14)
            make.leading.equalTo(14)
            make.trailing.equalTo(mainContentPlayButton.snp.trailing).inset(14)
            make.height.equalTo(22)
        }
        
        subcontentTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainContentImageView.snp.bottom).offset(14)
            make.leading.equalTo(14)
            make.height.equalTo(28)
        }
        
        subcontentFirstImageView.snp.makeConstraints { make in
            make.top.equalTo(subcontentTitleLabel.snp.bottom).offset(14)
            make.leading.equalTo(14)
            make.trailing.equalTo(5)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(150)
        }
        
        subcontentSecondImageView.snp.makeConstraints { make in
            make.top.equalTo(subcontentTitleLabel.snp.bottom).offset(14)
            make.leading.equalTo(subcontentFirstImageView.snp.trailing).offset(5)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(150)
        }
        
        subcontentThirdImageView.snp.makeConstraints { make in
            make.top.equalTo(subcontentTitleLabel.snp.bottom).offset(14)
            make.leading.equalTo(subcontentSecondImageView.snp.trailing).offset(5)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(150)
        }
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        
        UserNicknameLabel.setTextLable("Jack", fontSize: 24)
        mainContentLable.setTextLable("흥미진진 ・ 사극 ・ 전투 ・ 한국작품", fontSize: 12)
        subcontentTitleLabel.setTextLable("지금 뜨는 콘텐츠", fontSize: 16)

        mainContentPlayButton.setTitle("재생", for: .normal)
        mainContentPlayButton.setTitleColor(.black, for: .normal)
        mainContentPlayButton.setTitleColor(.darkGray, for: .highlighted)
        mainContentPlayButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        mainContentPlayButton.backgroundColor = .white
        mainContentPlayButton.layer.cornerRadius = 6
        
        mainContentImageView.setImageView(12)
        subcontentFirstImageView.setImageView(6)
        subcontentSecondImageView.setImageView(6)
        subcontentThirdImageView.setImageView(6)
    }
}


extension UIImageView {
    
    func setImageView(_ radius: Int) {
        self.backgroundColor = .gray
        self.layer.cornerRadius = CGFloat(radius)
    }
}

extension UILabel {
    
    func setTextLable(_ text: String, fontSize: Int) {
        self.text = text
        self.textAlignment = .center
        self.font = .systemFont(ofSize: CGFloat(fontSize), weight: .bold)
        self.textColor = .white
    }
}
