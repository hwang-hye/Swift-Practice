//
//  MainTableViewCell.swift
//  Tamagotchi
//
//  Created by hwanghye on 6/9/24.
//

import UIKit
import Kingfisher
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let indentifier = "MainTableViewCell"
    
    let horizontalStackView = UIStackView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureStackView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureHierarchy() {
        contentView.addSubview(horizontalStackView)
    }
    
    
    private func setupConstraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    private func configureStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 10
    }
    
    func configure(with images: [UIImage?], texts: [String]) {
        horizontalStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (index, image) in images.enumerated() {
            let stackView = createImageLabelStack(image: image, text: texts[index])
            horizontalStackView.addArrangedSubview(stackView)
        }
    }
    
    private func createImageLabelStack(image: UIImage?, text: String) -> UIStackView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        let imageLabel = UILabel()
        imageLabel.textAlignment = .center
        imageLabel.font = .systemFont(ofSize: 12, weight: .regular)
        imageLabel.text = text
        imageLabel.layer.cornerRadius = 6
        imageLabel.layer.borderWidth = 0.3
        
        
        let stackView = UIStackView(arrangedSubviews: [imageView, imageLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        

        imageView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(imageView.snp.width)
        }
        
        imageLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.height.equalTo(20)
        }
        
        return stackView
    }
}
