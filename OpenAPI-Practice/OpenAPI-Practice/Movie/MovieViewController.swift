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
            make.width.equalTo(200)
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
        
        
        
        // 대략 10개의 rankStackView UI 생성
          for i in 1...10 {
              let rankStackView = createRankStackView(rank: i)
              movieRankStackView.addArrangedSubview(rankStackView)
          }
    }
    

    func createRankStackView(rank: Int) -> UIStackView {
        // horizontal stack view 생성
        let movieInfoStackView = UIStackView()
        movieInfoStackView.axis = .horizontal
        movieInfoStackView.spacing = 10
        movieInfoStackView.alignment = .center
        movieInfoStackView.distribution = .fillEqually
        
        // rankLabel
        let movieRankLabel = UILabel()
        movieRankLabel.text = "\(rank)"
        movieRankLabel.textColor = .black
        movieRankLabel.textAlignment = .center
        movieRankLabel.backgroundColor = .white
        movieInfoStackView.addArrangedSubview(movieRankLabel)
        
        // titleLabel
        let movieTitleLabel = UILabel()
        movieTitleLabel.text = "Title \(rank)"
        movieTitleLabel.textColor = .white
        movieTitleLabel.textAlignment = .left
        movieInfoStackView.addArrangedSubview(movieTitleLabel)
        
        // dateLabel
        let movieDateLabel = UILabel()
        movieDateLabel.text = "2024-06-06"
        movieDateLabel.textColor = .white
        movieDateLabel.textAlignment = .center
        movieInfoStackView.addArrangedSubview(movieDateLabel)
        
        return movieInfoStackView
    }
}


