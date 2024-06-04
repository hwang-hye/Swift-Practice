//
//  ViewController.swift
//  Movie
//
//  Created by hwanghye on 6/4/24.
//

import UIKit

class ViewController: UIViewController {
    


    // viewcontroller 생명주기
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureTableView()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureTableView()

    }
    
    func configureTableView() {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

