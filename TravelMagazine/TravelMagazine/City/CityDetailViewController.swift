//
//  CityDetailViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/30/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    
    @IBOutlet var cityDescriptDetailLabel: UILabel!
    @IBOutlet var cityRatingLabel: UILabel!
    
    // Pass Data 1
    var data: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pass Data 3
        guard let data = data else { return }
        navigationItem.title = data.title
        cityDescriptDetailLabel.text = data.description
        cityRatingLabel.text = "이 여행지의 별점은 \(data.grade ?? 0.0)입니다"
    
    }
    

}
