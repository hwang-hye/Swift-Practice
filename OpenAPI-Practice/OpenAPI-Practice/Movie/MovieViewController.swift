//
//  MovieViewController.swift
//  OpenAPI-Practice
//
//  Created by hwanghye on 6/7/24.
//

import UIKit
import Alamofire
import SnapKit


// 최상위 구조체
struct BoxOfficeResult: Decodable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}

// dailyBoxOfficeList 배열 요소의 구조체
struct DailyBoxOffice: Decodable {
    let rank: String
    let movieNm: String
    let openDt: String
}

// JSON 데이터를 디코딩할 때 사용하는 구조체
struct MovieData: Decodable {
    let boxOfficeResult: BoxOfficeResult
}


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
        searchDateTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        searchDateTextField.leftViewMode = .always
        
        // placeholder 색상 설정
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray
        ]
        searchDateTextField.attributedPlaceholder = NSAttributedString(string: "날짜를 입력하세요 ex)20200401", attributes: placeholderAttributes)
        
        searchDateButton.setTitle("검색", for: .normal)
        searchDateButton.setTitleColor(.black, for: .normal)
        searchDateButton.setTitleColor(.darkGray, for: .highlighted)
        searchDateButton.backgroundColor = .white
        searchDateButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        movieRankStackView.axis = .vertical
        movieRankStackView.spacing = 20
        movieRankStackView.alignment = .fill
        movieRankStackView.distribution = .equalSpacing
    }
    
    
    @objc func searchButtonClicked() {
        let dateText = searchDateTextField.text ?? ""
        callRequest(dateText)
    }
    
    
    func callRequest(_ date: String) {
        let url = "\(APIURL.movieRankURL)\(date)"
        
        AF.request(url).responseDecodable(of: MovieData.self) { response in
            switch response.result {
            case .success(let movieData):
                self.updateUI(with: movieData.boxOfficeResult.dailyBoxOfficeList)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func updateUI(with dailyBoxOfficeList: [DailyBoxOffice]) {
        for view in movieRankStackView.arrangedSubviews {
            movieRankStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        for movie in dailyBoxOfficeList {
            let rankView = createRankItemStackView(rank: movie.rank, title: movie.movieNm, date: movie.openDt)
            movieRankStackView.addArrangedSubview(rankView)
        }
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
    }
    
    
    func createRankItemStackView(rank: String, title: String, date: String) -> UIStackView {
        let rankItemStackView = UIStackView()
        rankItemStackView.axis = .horizontal
        rankItemStackView.spacing = 14
        rankItemStackView.alignment = .center
        
        let rankLabel = UILabel()
        rankLabel.text = rank
        rankLabel.font = .boldSystemFont(ofSize: 16)
        rankLabel.textColor = .black
        rankLabel.textAlignment = .center
        rankLabel.backgroundColor = .white
        rankLabel.snp.makeConstraints { make in
            make.width.equalTo(30)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
        }
        
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = .systemFont(ofSize: 14, weight: .regular)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .center
        
        rankItemStackView.addArrangedSubview(rankLabel)
        rankItemStackView.addArrangedSubview(titleLabel)
        rankItemStackView.addArrangedSubview(dateLabel)
        
        return rankItemStackView
    }
}
