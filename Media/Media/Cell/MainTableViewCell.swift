//
//  MainTableViewCell.swift
//  Media
//
//  Created by hwanghye on 6/11/24.
//

import UIKit
import Alamofire
import Kingfisher
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    
    let releaseDateLabel = UILabel()
    let genreHashtagLabel = UILabel()
    
    let thumbnailImageView = UIImageView()
    let ratingInfoLabel = UILabel()
    let ratingLabel = UILabel()
    
    let infoTextBackgroundView = UIView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let separatorLine = UIView()
    let detailMoreLabel = UILabel()
    let detailMoreButton = UIButton()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureUI()
        configureLayout()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(genreHashtagLabel)
        contentView.addSubview(thumbnailImageView)
        thumbnailImageView.addSubview(ratingInfoLabel)
        thumbnailImageView.addSubview(ratingLabel)
        contentView.addSubview(infoTextBackgroundView)
        infoTextBackgroundView.addSubview(titleLabel)
        infoTextBackgroundView.addSubview(subtitleLabel)
        infoTextBackgroundView.addSubview(separatorLine)
        infoTextBackgroundView.addSubview(detailMoreLabel)
        infoTextBackgroundView.addSubview(detailMoreButton)
    }
    
    func configureUI() {
        releaseDateLabel.text = "12/10/2020"
        releaseDateLabel.font = .systemFont(ofSize: 12, weight: .medium)
        releaseDateLabel.textColor = .gray
        
        genreHashtagLabel.text = "#Mystery"
        genreHashtagLabel.font = .systemFont(ofSize: 16, weight: .bold)
                
        ratingInfoLabel.text = "평점"
        ratingInfoLabel.textAlignment = .center
        ratingInfoLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        ratingInfoLabel.textColor = .white
        ratingInfoLabel.backgroundColor = .purple
        
        ratingLabel.text = "3.3"
        ratingLabel.textAlignment = .center
        ratingLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        ratingLabel.textColor = .black
        ratingLabel.backgroundColor = .white
        
        infoTextBackgroundView.backgroundColor = .lightGray
        
        titleLabel.text = "Alice in BorderLand"
        subtitleLabel.text = "Kento Yamazaki, Tao Tsuchiya"
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        subtitleLabel.textColor = .gray
        
        separatorLine.backgroundColor = .black
        
        detailMoreLabel.text = "자세히 보기"
        detailMoreLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        detailMoreButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        detailMoreButton.tintColor = .darkGray
        detailMoreButton.setTitleColor(.gray, for: .selected)
     
    }
    
    func configureLayout() {
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(16)
        }
        
        genreHashtagLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseDateLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(22)
        }
        
        thumbnailImageView.snp.makeConstraints { make in
            make.top.equalTo(genreHashtagLabel.snp.bottom).offset(6)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(180)
        }
        
        ratingInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(thumbnailImageView.snp.leading).inset(10)
            make.bottom.equalTo(thumbnailImageView.snp.bottom).inset(10)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.leading.equalTo(ratingInfoLabel.snp.trailing)
            make.bottom.equalTo(thumbnailImageView.snp.bottom).inset(10)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
        
        infoTextBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(thumbnailImageView.snp.bottom)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(infoTextBackgroundView.snp.top).inset(10)
            make.horizontalEdges.equalTo(infoTextBackgroundView.snp.horizontalEdges).inset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.horizontalEdges.equalTo(infoTextBackgroundView.snp.horizontalEdges).inset(10)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(infoTextBackgroundView.snp.horizontalEdges).inset(10)
            make.height.equalTo(0.8)
        }
        
        detailMoreLabel.snp.makeConstraints { make in
            make.bottom.equalTo(infoTextBackgroundView.safeAreaLayoutGuide).inset(14)
            make.leading.equalTo(infoTextBackgroundView.snp.leading).inset(10)
        }
        
        detailMoreButton.snp.makeConstraints { make in
            make.top.equalTo(separatorLine.snp.bottom).offset(10)
            make.trailing.equalTo(separatorLine.snp.trailing).inset(10)
            make.bottom.equalTo(infoTextBackgroundView.safeAreaLayoutGuide).inset(10)
        }
        
    }

}
