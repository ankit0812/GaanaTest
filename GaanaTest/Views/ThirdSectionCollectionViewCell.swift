//
//  ThirdSectionCollectionViewCell.swift
//  GaanaTest
//
//  Created by KingpiN on 27/07/19.
//  Copyright © 2019 KingpiN. All rights reserved.
//

import UIKit

class ThirdSectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ivTrackImage: UIImageView!
    @IBOutlet weak var lblTrackName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivTrackImage.layer.cornerRadius =  ivTrackImage.frame.size.width/2
        ivTrackImage.clipsToBounds = true
    }
}
