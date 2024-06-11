//
//  MainViewController.swift
//  Media
//
//  Created by hwanghye on 6/10/24.
//

import UIKit
import Alamofire
import Kingfisher
import SnapKit


class MainViewController: UIViewController {
    
    let mainTableView = UITableView()
    
    var list: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuBarButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(menuBarButtonClicked))
        let searchBarButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchBarButtonClicked))
        
        navigationItem.leftBarButtonItem = menuBarButton
        navigationItem.rightBarButtonItem = searchBarButton
        
        configureUI()
        configureTableView()
        callRequestMain()
        
    }
    
    
    func callRequestMain() {
        print(#function)
        
        let url = "\(APIURL.tmdbURL)\(APIKey.api_key)"
        
        AF.request(url, method: .get)
            .responseDecodable(of: MovieTrend.self) { response in
                switch response.result {
                case .success(let value):
                    print("SUCCESS")
                    dump(value)
                    self.list = value.results
                    self.mainTableView.reloadData()
                    
                case .failure(let error):
                    print("Failed")
                    print(error)
                }
            }
    }
    
    
    @objc func menuBarButtonClicked() {
        print("menuBarButtonClick!")
    }
    
    @objc func searchBarButtonClicked() {
        print("searchBarButtonClick!")
    }
    
    func configureUI() {
        view.backgroundColor = .white
        mainTableView.rowHeight = 380
        self.title = "TREND WEEK"
    }
    
    func configureTableView() {
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        let movie = list[indexPath.row]
        cell.releaseDateLabel.text = movie.releaseDate
        
        if let imageURL = URL(string: "\(APIURL.tmdbImageURL)\(movie.backdropPath)") {
            cell.thumbnailImageView.kf.setImage(with: imageURL)
        }
        
        let rating = String(format: "%.1f", movie.voteAverage)
        cell.ratingLabel.text = rating
        
        cell.titleLabel.text = movie.originalTitle
        cell.subtitleLabel.text = movie.overview
        
        return cell
    }
}
