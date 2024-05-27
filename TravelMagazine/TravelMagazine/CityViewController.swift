//
//  CityViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/27/24.
//

import UIKit


class CityViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var cityTableView: UITableView!
    
    // Travel 데이터
    var list = TravelInfo().travel
    
    
    // 화면에 그려줌
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.rowHeight = 120

        // TableView의 delegate, datagate 속성을 현재 객체(self)로 설정
        // TableView에서 발생하는 이벤트를 현재 객체에서 처리하겠다는 뜻
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        // CityTableViewCell XIB 파일을 등록
        // 이를 cityTableView에서 재사용할 셀로 사용하는 과정
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
        
    }
    
    
    // numberOfRowsInSection: 보여줄 셀의 갯수 정의
    // list의 갯수만큼
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    
    // cellForRowAt: TableView에 구성될 셀의 정보
    // 구성된 셀 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // CityTableViewCell에서 내려받은 CityTableViewCell 셀 정의
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        let data = list[indexPath.row]
        
        // 내려받은 cell의 UI를 사용?
        cell.configureCell(data: data)
        
        return cell
    }
    

    
    
    



}
