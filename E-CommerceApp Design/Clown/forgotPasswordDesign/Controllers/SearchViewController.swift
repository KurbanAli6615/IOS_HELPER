//
//  SearchViewController.swift
//  Clown
//
//  Created by Sapphire on 09/06/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    let categoryArray = ["Toys for Girls","Toys for Boys","Educational Toys","Crushes","Cupping and Water Pumps","Balls","Keychains","Soft Toys","Pillows","Beach Items"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK:-  Halper Function
    func setupUI(){
        searchTextField.setIcon(UIImage(named: "glass")!)
        
//        Setup TableView
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        categoryTableView.tableFooterView = UIView()
    }
    @IBAction func logoTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.selectedIndex = 0
    }
    @IBAction func cartButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "AddToBagViewController") as! AddToBagViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        
        cell.cellLabel.text = categoryArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryTableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
}
