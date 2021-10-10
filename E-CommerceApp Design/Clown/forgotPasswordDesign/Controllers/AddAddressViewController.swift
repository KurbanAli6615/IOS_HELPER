//
//  AddAddressViewController.swift
//  Clown
//
//  Created by Sapphire on 11/06/21.
//

import UIKit

class AddAddressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
