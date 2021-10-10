//
//  CheckOutViewController.swift
//  Clown
//
//  Created by Sapphire on 11/06/21.
//

import UIKit

class CheckOutViewController: UIViewController {
    
    @IBOutlet weak var addAddressButtonOutlet: UIButton!
    @IBOutlet weak var addCommentTextField: UITextField!
    @IBOutlet weak var addressRadioButton: UIButton!
    @IBOutlet weak var payWithOnlineRadio: UIButton!
    @IBOutlet weak var cashOndeliveryRadio: UIButton!
    @IBOutlet weak var agreeMentCheckBox: UIButton!
    
    var isCheckBoxChecked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAddressButtonOutlet.layer.borderWidth = 1.5;
        addAddressButtonOutlet.layer.borderColor = UIColor(named: "themeMain")?.cgColor
        addAddressButtonOutlet.layer.cornerRadius = 5
        
        //
        payWithOnlineRadio.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        cashOndeliveryRadio.setImage(#imageLiteral(resourceName: "uncheckedRadio"), for: .normal)
//        agreeMentCheckBox.setImage(#imageLiteral(resourceName: "uncheckedCheckBox"), for: .normal)
        //
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: addCommentTextField.frame.height - 1, width: self.view.frame.size.width - 40, height: 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        addCommentTextField.borderStyle = UITextField.BorderStyle.none
        addCommentTextField.layer.addSublayer(bottomLine)
    }
    
    @IBAction func cencelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func payWithOnlineRadioTapped(_ sender: Any) {
        payWithOnlineRadio.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        cashOndeliveryRadio.setImage(#imageLiteral(resourceName: "uncheckedRadio"), for: .normal)
    }
    @IBAction func cashOnDeliveryTapped(_ sender: Any) {
        payWithOnlineRadio.setImage(#imageLiteral(resourceName: "uncheckedRadio"), for: .normal)
        cashOndeliveryRadio.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
    }
    @IBAction func checkBoxButtonTapped(_ sender: Any) {
        print("checkBox Tapped")
        if isCheckBoxChecked{
            agreeMentCheckBox.setImage(#imageLiteral(resourceName: "uncheckedCheckBox"), for: .normal)
            isCheckBoxChecked = !isCheckBoxChecked
        }else {
            agreeMentCheckBox.setImage(#imageLiteral(resourceName: "checkedBox"), for: .normal)
            isCheckBoxChecked = !isCheckBoxChecked
        }
    }
    @IBAction func addAddressPressed(_ sender: Any) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(identifier: "SelectAddressViewController") as! SelectAddressViewController, animated: true)
    }
    @IBAction func placeOrderTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "PlaceOrderSuccessViewController") as! PlaceOrderSuccessViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
