//
//  HomeVC.swift
//  ShobaikLobaik
//
//  Created by PC103-PC on 06/10/21.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuView.delegate = self
        SideMenuView.add(toVC: self, toView: self.view)
    }
    
    @IBAction func btnSideMenuTapped(_ sender: Any) {
        if !SideMenuView.isOpen {
            SideMenuView.open(toView: self.view)
            SideMenuView.isOpen = !SideMenuView.isOpen
        } else {
            SideMenuView.close(toView: self.view)
            SideMenuView.isOpen = !SideMenuView.isOpen
        }
    }
}

extension HomeVC: SideMenuViewDelegate {
    func btnHomeTapped() {
        print("Home Tapped")
    }
    
    func btnProfileTapped() {
        print("Profile Tapped")
    }
    
    func btnRegisterAsProviderTapped() {
        print("Register as provider Tapped")
    }
    
    func btnContactUsTapped() {
        print("Contact US Tapped")
    }
    
    func btnLogoutTapped() {
        print("Logout Tapped")
    }    
}
