//
//  UpdateProfileViewController.swift
//  Clown
//
//  Created by KurbanAli on 12/06/21.
//

import UIKit

class UpdateProfileViewController: UIViewController {

    @IBOutlet weak var resetButtonOutlet: UIButton!
    @IBOutlet weak var mrRadioOutlet: UIButton!
    @IBOutlet weak var mrsRadioOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true

        
        mrRadioOutlet.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        resetButtonOutlet.layer.borderWidth = 1.5;
        resetButtonOutlet.layer.borderColor = UIColor(named: "themeMain")?.cgColor
        resetButtonOutlet.layer.cornerRadius = 5
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = false

        navigationController?.popViewController(animated: true)
    }
    @IBAction func mrRadioTapped(_ sender: Any) {
        mrRadioOutlet.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        mrsRadioOutlet.setImage(#imageLiteral(resourceName: "uncheckedRadio"), for: .normal)
    }
    @IBAction func mrsRadioTapped(_ sender: Any) {
        mrRadioOutlet.setImage(#imageLiteral(resourceName: "uncheckedRadio"), for: .normal)
        mrsRadioOutlet.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
    }
}
