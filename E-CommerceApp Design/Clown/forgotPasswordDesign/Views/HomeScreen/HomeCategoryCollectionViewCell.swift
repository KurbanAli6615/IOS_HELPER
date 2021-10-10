//
//  HomeCategoryCollectionViewCell.swift
//  Clown
//
//  Created by Sapphire on 08/06/21.
//

import UIKit

class HomeCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 10
    }
    
}
