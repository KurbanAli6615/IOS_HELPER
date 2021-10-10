//
//  ForgotPasswordViewController.swift
//  forgotPasswordDesign
//
//  Created by Sapphire on 08/06/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }

    @IBAction func sendLinkTapped(_ sender: Any) {
        
        navigationController?.pushViewController(storyboard?.instantiateViewController(identifier: "MailSentViewController") as! MailSentViewController, animated: true)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
