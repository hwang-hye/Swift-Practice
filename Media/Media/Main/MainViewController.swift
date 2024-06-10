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

// Interface 정의
struct MovieTrend: Decodable {
    let page: String
    let results: [Movie]
}

struct Movie: Decodable {
    let backdropPath: String
    let id: Int
    let originalTitle, overview, posterPath, mediaType: String
    let adult: Bool
    let title, originalLanguage: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult, title
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


class MainViewController: UIViewController {
    
    let mainTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuBarButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(menuBarButtonClicked))
        let searchBarButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchBarButtonClicked))
        
        navigationItem.leftBarButtonItem = menuBarButton
        navigationItem.rightBarButtonItem = searchBarButton
        
        configureUI()
        configureTableView()
        
        

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
        // 임의의 Cell 3개 출력해서 UI확인
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        return cell
    }
}
