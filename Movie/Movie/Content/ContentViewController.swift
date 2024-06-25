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
    lazy var tableVIew = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.rowHeight = 200
        view.register(ContentTabelViewCell.self, forCellReuseIdentifier: ContentTabelViewCell.id)
        return view
    }()
    var posterImageList: [[String]] = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func configureHierarchy() {
        view.addSubview(tableVIew)
    }
    override func configureLayout() {
        tableVIew.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    override func configureView() {
    }
}

extension ContentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentTabelViewCell.id, for: indexPath) as! ContentTabelViewCell
        return cell
    }
}
