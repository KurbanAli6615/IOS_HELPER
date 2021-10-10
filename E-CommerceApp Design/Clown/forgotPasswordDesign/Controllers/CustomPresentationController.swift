//
//  CustomPresentationController.swift
//  Clown
//
//  Created by Sapphire on 09/06/21.
//

import UIKit

class CustomPresentationController: UIViewController{
    

    @IBOutlet weak var sortOptionsTableView: UITableView!
    
    let optionsArray = ["Available","Name: A to Z","Name: Z to A","Price: Low to Hight","Price: High to Low"]
    var selectedOptionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortOptionsTableView.delegate = self
        sortOptionsTableView.dataSource = self
        sortOptionsTableView.register(UINib(nibName: "SortTableViewCell", bundle: nil), forCellReuseIdentifier: "SortTableViewCell")
        sortOptionsTableView.tableFooterView = UIView()
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension CustomPresentationController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sortOptionsTableView.dequeueReusableCell(withIdentifier: "SortTableViewCell") as! SortTableViewCell
        
        cell.cellButton.setTitle(optionsArray[indexPath.row], for: .normal)
        if (indexPath.row == selectedOptionIndex){
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
}
