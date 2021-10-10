//
//  ProductTableViewCell.swift
//  Clown
//
//  Created by Sapphire on 10/06/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var likeButtonOutlet: UIButton!
    var isLiked:Bool = false
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        if isLiked{
            likeButtonOutlet.setImage(UIImage(systemName: "heart"), for: .normal)
            isLiked = !isLiked
        }else {
            likeButtonOutlet.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            isLiked = !isLiked

        }
    }
}
