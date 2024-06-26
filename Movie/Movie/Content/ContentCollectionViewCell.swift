//
//  ContentCollectionViewCell.swift
//  Movie
//
//  Created by hwanghye on 6/25/24.
//

import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell {
    static let id = "ContentCollectionViewCell"
    let posterImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
