//
//  ContactUsViewController.swift
//  Clown
//
//  Created by Sapphire on 15/06/21.
//

import UIKit

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
}
