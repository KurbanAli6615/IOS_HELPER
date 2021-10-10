//
//  OrderHistoryViewController.swift
//  Clown
//
//  Created by KurbanAli on 12/06/21.
//

import UIKit

class OrderHistoryViewController: UIViewController {

    @IBOutlet weak var tblOrderHistory: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true

        tblOrderHistory.delegate = self
        tblOrderHistory.dataSource = self
        tblOrderHistory.register(UINib(nibName: "OrderHistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderHistoryTableViewCell")
        tblOrderHistory.tableFooterView = UIView()
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.tabBarController?.tabBar.isHidden = false

        navigationController?.popViewController(animated: true)
    }
    
}

extension OrderHistoryViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblOrderHistory.dequeueReusableCell(withIdentifier: "OrderHistoryTableViewCell") as! OrderHistoryTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        navigationController?.pushViewController(storyboard?.instantiateViewController(identifier: "OrderDetailsViewController") as! OrderDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    
}
