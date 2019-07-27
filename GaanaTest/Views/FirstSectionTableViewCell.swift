//
//  FirstSectionTableViewCell.swift
//  GaanaTest
//
//  Created by KingpiN on 27/07/19.
//  Copyright © 2019 KingpiN. All rights reserved.
//

import UIKit

class FirstSectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cvCollection: UICollectionView!
    var trackModel: [Track] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cvCollection.delegate = self
        self.cvCollection.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension FirstSectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstSectionCollectionViewCell", for: indexPath) as? FirstSectionCollectionViewCell else { return UICollectionViewCell()}
        if indexPath.row < trackModel.count {
            let currentTrack = trackModel[indexPath.row]
            cell.ivTrackImage.loadImageUsingCacheWithURLString(currentTrack.atw ?? "", placeHolder: nil) { (_) in}
            cell.lblTrackName.text = currentTrack.name
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 155, height: 200)
    }
    
    
}
