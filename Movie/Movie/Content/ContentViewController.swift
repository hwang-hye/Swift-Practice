//
//  ContentViewController.swift
//  Movie
//
//  Created by hwanghye on 6/25/24.
//

import UIKit
import Kingfisher
import SnapKit

class ContentViewController: BaseViewController {
    lazy var tableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.rowHeight = 200
        view.register(ContentTableViewCell.self, forCellReuseIdentifier: ContentTableViewCell.id)
        return view
    }()
    
    var imageList: [[TrendingDetail]] = [
    [TrendingDetail(poster_path: "")],
    [TrendingDetail(poster_path: "")],
    [TrendingDetail(poster_path: "")]
    ]
    
    var selectedIndexPathItem: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPI.shared.tmdb(api: .trendingMovie) {
                movie, error in
                if let error = error {
                    print(error)
                } else {
                    guard let movie = movie else { return }
                    self.imageList[0] = movie
                }
                group.leave()
            }
        }
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPI.shared.tmdb(api: .trendingTV) {
                movie, error in
                if let error = error {
                    print(error)
                } else {
                    guard let movie = movie else { return }
                    self.imageList[1] = movie
                }
                group.leave()
            }
        }
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPI.shared.tmdb(api: .search(query: "love")) {
                movie, error in
                if let error = error {
                    print(error)
                } else {
                    guard let movie = movie else { return }
                    self.imageList[2] = movie
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    override func configureHierarchy() {
        view.addSubview(tableView)
    }
    override func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        tableView.backgroundColor = .black
        // tableView Cell, collectionView Cell backgroundColor까지 바꿔주어야 함
        // 한번에 할 수 없는지?
    }
}

extension ContentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.id, for: indexPath) as! ContentTableViewCell
        cell.backgroundColor = .black
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        cell.collectionView.tag = indexPath.row
        cell.collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: ContentCollectionViewCell.id)
        cell.collectionView.reloadData()
        return cell
    }
}

extension ContentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCollectionViewCell.id, for: indexPath) as! ContentCollectionViewCell
        let data = imageList[collectionView.tag][indexPath.item]
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(data.poster_path)")
        cell.posterImageView.kf.setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = indexPath.item
        self.selectedIndexPathItem = selectedItem
        print("선택된 셀:\(selectedItem)")
        let contentDetailVC = ContentDetailViewController()
        contentDetailVC.selectedItem = selectedItem
        navigationController?.pushViewController(contentDetailVC, animated: true)
//        if let cell = collectionView.cellForItem(at: indexPath) as? ContentCollectionViewCell {
//            // 클릭된 cell이 할 일
//        }
    }
}
