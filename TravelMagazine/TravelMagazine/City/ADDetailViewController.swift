//
//  ADDetailViewController.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/30/24.
//

import UIKit

class ADDetailViewController: UIViewController {

    
    @IBOutlet var adDescriptionLabel: UILabel!
    
    var data: Travel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "AD PAGE"
        
        guard let data = data else { return }
        adDescriptionLabel.text = "광고 내용은 \(data.title)"

    }
    

    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    

}
