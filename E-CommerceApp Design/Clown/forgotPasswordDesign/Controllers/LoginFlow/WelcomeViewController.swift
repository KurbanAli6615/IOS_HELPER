//
//  WelcomeViewController.swift
//  Clown
//
//  Created by Sapphire on 16/06/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var btnSignInOutlet: UIButton!
    @IBOutlet weak var btnSignUpOutlet: UIButton!
    @IBOutlet weak var btnSkipOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignInOutlet.layer.cornerRadius = 5
        
        btnSignUpOutlet.layer.cornerRadius = 5
        btnSignUpOutlet.backgroundColor = .white
        btnSignUpOutlet.layer.borderWidth = 1
        btnSignUpOutlet.layer.borderColor = UIColor(named: "themeMain")?.cgColor
        btnSignUpOutlet.setTitleColor(UIColor(named: "themeMain"), for: .normal)
    }
    @IBAction func signInTapped(_ sender: Any) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(identifier: "SignInViewController") as! SignInViewController, animated: true)
    }
    @IBAction func signUpTapped(_ sender: Any) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController, animated: true)
    }
    @IBAction func skipTapped(_ sender: Any) {
    }
}
