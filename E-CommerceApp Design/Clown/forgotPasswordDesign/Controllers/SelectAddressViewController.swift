//
//  SelectAddressViewController.swift
//  Clown
//
//  Created by Sapphire on 11/06/21.
//

import UIKit

class SelectAddressViewController: UIViewController {

    @IBOutlet weak var tblAddress: UITableView!
    
    var selectedTableViewCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblAddress.delegate = self
        tblAddress.dataSource = self
        tblAddress.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width , height: 100))
        let button = UIButton(frame: CGRect(x: (customView.frame.size.width - customView.frame.size.width * 0.8) / 2 , y: 40, width: customView.frame.size.width * 0.75, height: 60))
        button.layer.borderWidth = 1.5;
        button.layer.borderColor = UIColor(named: "themeMain")?.cgColor
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor(named: "themeMain"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        button.setTitle("+ Add Address", for: .normal)
        button.addTarget(self, action: #selector(addAddressButtonTapped), for: .touchUpInside)
        customView.addSubview(button)
        
        tblAddress.tableFooterView = customView
    }
    

    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addAddressButtonTapped(){
        let destination = storyboard?.instantiateViewController(identifier: "AddAddressViewController") as! AddAddressViewController
        navigationController?.pushViewController(destination, animated: true)
    }
}

extension SelectAddressViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblAddress.dequeueReusableCell(withIdentifier: "AddressTableViewCell") as! AddressTableViewCell
      
        if indexPath.row == selectedTableViewCellIndex {
            cell.mainView.layer.masksToBounds = true
            cell.mainView.layer.cornerRadius = 5
            cell.mainView.layer.borderWidth = 1
            cell.mainView.layer.shadowOffset = CGSize(width: -1, height: 1)
            cell.mainView.layer.borderColor = UIColor(named: "themeMain")?.cgColor
            cell.cellRadioButtonOutlet.image = #imageLiteral(resourceName: "radio")
        }else {
            cell.mainView.layer.borderWidth = 0
            cell.cellRadioButtonOutlet.image = #imageLiteral(resourceName: "uncheckedRadio")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        selectedTableViewCellIndex = indexPath.row
        tableView.reloadData()
        tblAddress.deselectRow(at: indexPath, animated: true)
    }
 
    
}
