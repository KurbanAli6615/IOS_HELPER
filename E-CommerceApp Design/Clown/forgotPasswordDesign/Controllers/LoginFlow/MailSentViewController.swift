//
//  MailSentViewController.swift
//  Clown
//
//  Created by Sapphire on 15/06/21.
//

import UIKit

class MailSentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func processToLoginTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
