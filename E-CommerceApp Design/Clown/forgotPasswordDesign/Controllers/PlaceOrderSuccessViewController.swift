//
//  PlaceOrderSuccessViewController.swift
//  Clown
//
//  Created by Sapphire on 11/06/21.
//

import UIKit

class PlaceOrderSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToHomePressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.selectedIndex = 0
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
