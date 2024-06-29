//
//  ContentDetailViewController.swift
//  Movie
//
//  Created by hwanghye on 6/29/24.
//

import UIKit

class ContentDetailViewController: BaseViewController {
    
    var selectedItem: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let item = selectedItem {
            print("ContentDetailViewController item: \(item)")
        }
    }
}
