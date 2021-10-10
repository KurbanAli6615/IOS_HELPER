//
//  SignInViewController.swift
//  Clown
//
//  Created by Sapphire on 16/06/21.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var TxtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        TxtEmail.delegate = self
    }
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func signInTapped(_ sender: Any) {
        //        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        mainTabBarController.modalPresentationStyle = .fullScreen
        self.present(mainTabBarController, animated: true, completion: nil)
    }
    @IBAction func signUpTapped(_ sender: Any) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController, animated: true)
    }
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        self.navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController, animated: true)
    }
}

extension SignInViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

            return true
    }
}
