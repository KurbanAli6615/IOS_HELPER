//
//  AddToBagViewController.swift
//  Clown
//
//  Created by Sapphire on 10/06/21.
//

import UIKit

class AddToBagViewController: UIViewController {

    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var noItemView: UIView!
    @IBOutlet weak var footerButtons: UIView!
    
    var hideTabbarWhenScreenPop: Bool = false
    
    var isTableHidden: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        noItemView.isHidden = true
        itemsTableView.isHidden = false
        footerView.isHidden = false
        footerButtons.isHidden = false
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.register(UINib(nibName: "AddToBagTableViewCell", bundle: nil), forCellReuseIdentifier: "AddToBagTableViewCell")
    }
    

    @IBAction func crossButtonTapped(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = hideTabbarWhenScreenPop
        navigationController?.popViewController(animated: true)
    }
    @IBAction func checkOutButtonTapped(_ sender: Any) {
        let destination = storyboard?.instantiateViewController(identifier: "CheckOutViewController") as! CheckOutViewController
        
        navigationController?.pushViewController(destination, animated: true)
    }
    @IBAction func likeButtonTapped(_ sender: Any) {
        if isTableHidden{
            noItemView.isHidden = true
            itemsTableView.isHidden = false
            footerView.isHidden = false
            footerButtons.isHidden = false
            isTableHidden = !isTableHidden
        }else {
            noItemView.isHidden = false
            itemsTableView.isHidden = true
            footerView.isHidden = true
            footerButtons.isHidden = true
            isTableHidden = !isTableHidden
        }
    }
    @IBAction func continueShoppingTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.selectedIndex = 0
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension AddToBagViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddToBagTableViewCell") as! AddToBagTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
