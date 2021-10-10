//
//  SignUpViewController.swift
//  Clown
//
//  Created by Sapphire on 16/06/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var cBox1Outlet: UIButton!
    @IBOutlet weak var cBox2Outlet: UIButton!
    @IBOutlet weak var cBox3Outlet: UIButton!
    
    @IBOutlet weak var mrRadioOutlet: UIButton!
    @IBOutlet weak var mrsRadioOutlet: UIButton!
    
    var isSelectedcBox1: Bool = false
    var isSelectedcBox2: Bool = false
    var isSelectedcBox3: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func cBox1(_ sender: Any) {
        if isSelectedcBox1{
            cBox1Outlet.setImage(#imageLiteral(resourceName: "uncheckedCheckBox"), for: .normal)
            isSelectedcBox1 = !isSelectedcBox1
        }else {
            cBox1Outlet.setImage(#imageLiteral(resourceName: "checkedBox"), for: .normal)
            isSelectedcBox1 = !isSelectedcBox1
        }
    }
    @IBAction func cBox2(_ sender: Any) {
        if isSelectedcBox2{
            cBox2Outlet.setImage(#imageLiteral(resourceName: "uncheckedCheckBox"), for: .normal)
            isSelectedcBox2 = !isSelectedcBox2
        }else {
            cBox2Outlet.setImage(#imageLiteral(resourceName: "checkedBox"), for: .normal)
            isSelectedcBox2 = !isSelectedcBox2
        }
    }
    @IBAction func cBox3(_ sender: Any) {
        if isSelectedcBox3{
            cBox3Outlet.setImage(#imageLiteral(resourceName: "uncheckedCheckBox"), for: .normal)
            isSelectedcBox3 = !isSelectedcBox3
        }else {
            cBox3Outlet.setImage(#imageLiteral(resourceName: "checkedBox"), for: .normal)
            isSelectedcBox3 = !isSelectedcBox3
        }
    }
    
    @IBAction func mrRadioTapped(_ sender: Any) {
        mrRadioOutlet.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        mrsRadioOutlet.setImage(#imageLiteral(resourceName: "uncheckedRadio"), for: .normal)
    }
    @IBAction func mrsRadioTapped(_ sender: Any) {
        mrsRadioOutlet.setImage(#imageLiteral(resourceName: "radio"), for: .normal)
        mrRadioOutlet.setImage(#imageLiteral(resourceName: "uncheckedRadio"), for: .normal)
    }
    
}
