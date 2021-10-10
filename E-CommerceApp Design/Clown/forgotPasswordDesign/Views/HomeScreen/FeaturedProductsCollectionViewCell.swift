//
//  FeaturedProductsCollectionViewCell.swift
//  Clown
//
//  Created by Sapphire on 09/06/21.
//

import UIKit

class FeaturedProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellPriceLabel: UILabel!
    @IBOutlet weak var likeButtonOutlet: UIButton!
    
    var isLikeButtonSelected:Bool = false

    @IBAction func likeButtonPressed(_ sender: Any) {
        if isLikeButtonSelected {
      
            likeButtonOutlet.setImage(UIImage(systemName: "heart"), for: .normal)
            isLikeButtonSelected = !isLikeButtonSelected
           } else {
            likeButtonOutlet.tintColor = UIColor.red
            likeButtonOutlet.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            isLikeButtonSelected = !isLikeButtonSelected
           }
    }
}
