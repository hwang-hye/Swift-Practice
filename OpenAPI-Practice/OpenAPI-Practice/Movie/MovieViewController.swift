//
//  MovieViewController.swift
//  OpenAPI-Practice
//
//  Created by hwanghye on 6/7/24.
//

import UIKit
import SnapKit


class MovieViewController: UIViewController {
    
    let searchDateTextField = UITextField()
    let searchDateButton = UIButton()
    let movieRankStackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    
    func configureHierarchy() {
        view.addSubview(searchDateTextField)
        view.addSubview(searchDateButton)
        view.addSubview(movieRankStackView)
    }
    
    
    func configureUI() {
        searchDateTextField.placeholder = "날짜를 입력하세요 ex)20200401"
        searchDateTextField.borderStyle = .line
        searchDateTextField.layer.borderWidth = 3
        searchDateTextField.layer.borderColor = UIColor.white.cgColor
        searchDateTextField.textColor = .white
        searchDateTextField.font = .systemFont(ofSize: 16, weight: .semibold)
        
        // 변경된 placeholder 색상 및 들여쓰기 설정
        let placeholderColor = UIColor.gray
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 10 
        
        searchDateTextField.attributedPlaceholder = NSAttributedString(
            string: "날짜를 입력하세요 ex)20200401",
            attributes: [
                NSAttributedString.Key.foregroundColor: placeholderColor,
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ]
        )
        
        
        searchDateButton.setTitle("검색", for: .normal)
        searchDateButton.setTitleColor(.black, for: .normal)
        searchDateButton.setTitleColor(.darkGray, for: .highlighted)
        searchDateButton.backgroundColor = .white
        
        movieRankStackView.axis = .vertical
        movieRankStackView.spacing = 20
        movieRankStackView.alignment = .fill
        movieRankStackView.distribution = .equalSpacing
    }
    
    
    func configureLayout() {
        searchDateTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(searchDateButton.snp.leading).inset(-20)
            make.height.equalTo(50)
        }
        
        searchDateButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalTo(searchDateTextField.snp.trailing).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(60)
            make.height.equalTo(50)
        }
        
        movieRankStackView.snp.makeConstraints { make in
            make.top.equalTo(searchDateTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        
        // 대략 10개의 영화 순위 UI 생성
        for i in 1...10 {
            let rankItemStackView = createRankItemStackView(rank: i)
            movieRankStackView.addArrangedSubview(rankItemStackView)
        }
    }
    
    func createRankItemStackView(rank: Int) -> UIStackView {
        let rankItemStackView = UIStackView()
        rankItemStackView.axis = .horizontal
        rankItemStackView.spacing = 14
        rankItemStackView.alignment = .center
        
        let rankLabel = UILabel()
        rankLabel.text = "\(rank)"
        rankLabel.font = .boldSystemFont(ofSize: 16)
        rankLabel.textColor = .black
        rankLabel.textAlignment = .center
        rankLabel.backgroundColor = .white
        rankLabel.snp.makeConstraints { make in
            make.width.equalTo(30)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "Title \(rank)"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
        }
        
        let dateLabel = UILabel()
        dateLabel.text = "2024-06-06"
        dateLabel.font = .systemFont(ofSize: 14, weight: .regular)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .center
        
        rankItemStackView.addArrangedSubview(rankLabel)
        rankItemStackView.addArrangedSubview(titleLabel)
        rankItemStackView.addArrangedSubview(dateLabel)
        
        return rankItemStackView
    }
}
