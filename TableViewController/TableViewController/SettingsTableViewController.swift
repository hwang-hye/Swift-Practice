//
//  SettingsTableViewController.swift
//  TableViewController
//
//  Created by hwanghye on 5/23/24.
//

import UIKit

class SettingsTableViewController: UITableViewController {


    // Navigation Title
    @IBOutlet var titleUINavigation: UINavigationItem!
    
    
    // 변수
    var sectionList = ["전체 설정", "개인 설정", "기타"]
    
    var cellList = [
        ["공지사항", "실험실", "버전 정보"],
        ["개인/보안", "알림", "채팅", "멀티프로필"],
        ["고객센터/도움말"]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "설정"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // 셀 등록
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.reloadData()
        
    }
    
    
    // 1. 섹션의 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }

    
    // 2. 섹션 내 셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList[section].count
    }
    

    // 3. 셀의 내용 설정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cellList[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 12)
        
        return cell
    }
    
    
    // 4. 섹션 헤더의 타이틀
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section]
    }

}
