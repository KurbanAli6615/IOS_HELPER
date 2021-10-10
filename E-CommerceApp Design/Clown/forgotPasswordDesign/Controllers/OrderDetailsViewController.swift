//
//  OrderDetailsViewController.swift
//  Clown
//
//  Created by Sapphire on 14/06/21.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    @IBOutlet weak var tblItems: UITableView!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    
    var numberOfrows = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblItems.delegate = self
        tblItems.dataSource = self
        tblItems.register(UINib(nibName: "OrderDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderDetailsTableViewCell")
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cellReorderTapped(_ sender: Any){
        navigationController?.pushViewController(storyboard?.instantiateViewController(identifier: "ConfirmOrderViewController") as! ConfirmOrderViewController, animated: true)
    }
}

extension OrderDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tblHeight.constant = CGFloat(120 * numberOfrows)
        return numberOfrows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblItems.dequeueReusableCell(withIdentifier: "OrderDetailsTableViewCell") as! OrderDetailsTableViewCell
        
        cell.cellReorder.addTarget(self, action: #selector(cellReorderTapped(_:)), for: .touchUpInside)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblItems.deselectRow(at: indexPath, animated: true)
    }
    
}
