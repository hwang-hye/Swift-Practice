//
//  TravelMagazineTableViewCell.swift
//  TravelMagazine
//
//  Created by hwanghye on 5/28/24.
//

import UIKit
import Kingfisher

class TravelMagazineTableViewCell: UITableViewCell {
    
    // Data 공간에 필요할 때 꺼내쓸 identifier 만들어둠
    static let identifier = "TravelMagazineTableViewCell"
    
    // TravelMagazine Cell Outlet
    @IBOutlet var travelMagazineTitleLabel: UILabel!
    @IBOutlet var travelMagazineSubtitleLabel: UILabel!
    @IBOutlet var travelMagazineDate: UILabel!
    @IBOutlet var travelMagazineImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureLayout()
    }

    
    func configureLayout() {
        
        travelMagazineTitleLabel.setTitleLabel()
        travelMagazineSubtitleLabel.setSubtitleLabl()
        travelMagazineDate.setDateLabel()
        
    }
    
    
    // 100% case 대응, 처리(else)
    // 재사용을 할 때 예전 데이터가 남아 있으면 clear(prepareForReuse)
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .white
        travelMagazineImageView.image = nil
    }
    
    
    func configureCell(_ data: Magazine) {
        
        travelMagazineTitleLabel.text = data.title
        travelMagazineSubtitleLabel.text = data.subtitle
        travelMagazineDate.text = data.formattedDate()

        let url = URL(string: data.photo_image)
        travelMagazineImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        travelMagazineImageView.contentMode = .scaleAspectFill
    }
    
}


