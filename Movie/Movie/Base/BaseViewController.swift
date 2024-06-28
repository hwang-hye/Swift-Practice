//
//  BaseViewController.swift
//  Movie
//
//  Created by hwanghye on 6/25/24.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureHierarchy()
        configureLayout()
        configureView()
    }
    func configureHierarchy() { }
    func configureLayout() { }
    func configureView() { }
}
