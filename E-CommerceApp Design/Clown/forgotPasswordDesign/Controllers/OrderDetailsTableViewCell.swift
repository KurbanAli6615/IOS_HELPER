//
//  OrderDetailsTableViewCell.swift
//  Clown
//
//  Created by Sapphire on 14/06/21.
//

import UIKit

class OrderDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var returnButtonOutlet: UIButton!
    @IBOutlet weak var cellReorder: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        returnButtonOutlet.layer.borderWidth = 1.5;
        returnButtonOutlet.layer.borderColor = UIColor(named: "themeMain")?.cgColor
        returnButtonOutlet.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
