//
//  AccountViewController.swift
//  Clown
//
//  Created by KurbanAli on 12/06/21.
//

import UIKit

class AccountViewController: UIViewController {
    
    let optionsArr = ["Addresses","Order History","My Receipt","About Us","Our Team","Job","Privacy Policy","Payment and Delivery","Regulations","Contact Us"]

    @IBOutlet weak var tblAccount: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblAccount.delegate = self
        tblAccount.dataSource = self
        tblAccount.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }
    @IBAction func logoTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.selectedIndex = 0
    }
    @IBAction func editButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(storyboard?.instantiateViewController(identifier: "UpdateProfileViewController") as! UpdateProfileViewController, animated: true)
    }
    @IBAction func logoutTapped(_ sender: Any) {
        print("LogOut")
        self.dismiss(animated: true, completion: nil)
    }
}

extension AccountViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        optionsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblAccount.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        
        cell.cellLabel.text = optionsArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblAccount.deselectRow(at: indexPath, animated: true)
        if (indexPath.row == 1){
            navigationController?.pushViewController(storyboard?.instantiateViewController(identifier: "OrderHistoryViewController") as! OrderHistoryViewController, animated: true)
        }
        
        if  (indexPath.row == 9){
            navigationController?.pushViewController(storyboard?.instantiateViewController(identifier: "ContactUsViewController") as! ContactUsViewController, animated: true)
        }
    }
}
