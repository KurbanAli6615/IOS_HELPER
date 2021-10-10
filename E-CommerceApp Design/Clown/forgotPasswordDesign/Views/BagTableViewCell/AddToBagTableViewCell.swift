//
//  AddToBagTableViewCell.swift
//  Clown
//
//  Created by Sapphire on 10/06/21.
//

import UIKit

class AddToBagTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellMainTitle: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var quantity = 01
    
    @IBAction func decreseButtonTapped(_ sender: Any) {
        if quantity > 0{
            quantity -= 1
            quantityLabel.text = String(format: "%02d", quantity)
        }
    }
    
    @IBAction func increseButtonTapped(_ sender: Any) {
        quantity += 1
        quantityLabel.text = String(format: "%02d", quantity)
    }
    @IBAction func deleteButtonTapped(_ sender: Any) {
    }
}
