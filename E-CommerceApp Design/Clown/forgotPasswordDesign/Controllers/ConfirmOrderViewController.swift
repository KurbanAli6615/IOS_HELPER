//
//  ConfirmOrderViewController.swift
//  Clown
//
//  Created by Sapphire on 14/06/21.
//

import UIKit

class ConfirmOrderViewController: UIViewController {

    @IBOutlet weak var tblItems: UITableView!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    
    var numberOfRows = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblItems.delegate = self
        tblItems.dataSource = self
        tblItems.register(UINib(nibName: "ReOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "ReOrderTableViewCell")
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension ConfirmOrderViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tblHeight.constant = CGFloat(100 * numberOfRows)
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblItems.dequeueReusableCell(withIdentifier: "ReOrderTableViewCell") as! ReOrderTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
