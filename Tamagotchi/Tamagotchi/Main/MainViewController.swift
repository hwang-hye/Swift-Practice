//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by hwanghye on 6/9/24.
//

import UIKit
import SnapKit


class MainViewController: UIViewController {
    
    let mainTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureLayout()
        configureUI()
        
    }
    
    func configureTableView() {
        view.addSubview(mainTableView)
        
        mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.indentifier)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    func configureLayout() {
        
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        self.title = "다마고치 선택하기"
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20 / 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.indentifier, for: indexPath) as! MainTableViewCell
        
        // 셀에 표시할 이미지와 텍스트를 설정
        let images: [UIImage?] = [
            UIImage(named: "1-1"),
            UIImage(named: "1-1"),
            UIImage(named: "1-1")
        ]
        
        let texts: [String] = [
            "Text1",
            "Text2",
            "Text3"
        ]
  
        cell.configure(with: images, texts: texts)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
