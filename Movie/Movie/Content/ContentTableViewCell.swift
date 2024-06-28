//
//  ContentTabelViewCell.swift
//  Movie
//
//  Created by hwanghye on 6/25/24.
//

import UIKit
import SnapKit

class ContentTableViewCell: BaseTableViewCell {
    static let id = "ContentTableViewCell"
    
    let titleLabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        view.text = "tableview title"
        view.textColor = .white
        return view
    }()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    static func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 160)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        return layout
    }
    
    override func configureHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)

    }
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(20)
        }
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(contentView)
            make.top.equalTo(titleLabel.snp.bottom)
        }
    }
    override func configureView() {
        collectionView.backgroundColor = .black
    }
}
