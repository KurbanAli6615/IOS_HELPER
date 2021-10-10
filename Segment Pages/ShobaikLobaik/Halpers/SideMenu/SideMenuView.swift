//
//  SideMenuView.swift
//  OccuCare
//
//  Created by PC23 on 03/08/17.
//  Copyright © 2017 Sapphire. All rights reserved.
//

import UIKit

class SideMenuView: UIView {
    
    static var sideMenu: UIView = UIView()
    static var isOpen = Bool()
    static var menuSize: CGFloat = 60
    static var trasparentView = UIView()
    static var toView = UIView()
    static var btnIndex: Int = 0
    
    static var cardTag = 0
    static var LoyaltyMallTag = 0
        
    static var delegate:SideMenuViewDelegate?
    
    override func draw(_ rect: CGRect) {
        setUI()
    }
    
    // MARK: Set UI
    func setUI() {
        
        self.frame = CGRect(x: -(Device.screenWidth - SideMenuView.menuSize), y: 0, width: Device.screenWidth - SideMenuView.menuSize, height: Device.screenHeight)
        
        SideMenuView.sideMenu = self
        
        SideMenuView.trasparentView.frame = CGRect(x: 0, y: 0, width: Device.screenWidth, height: Device.screenHeight)
        SideMenuView.trasparentView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        addTapGesture()
        addSwipeGesture()
       
    }
    
    // MARK: Add Tap gesture
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(onTap))
        SideMenuView.trasparentView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: Add Swipe gesture
    func addSwipeGesture() {
        
        let swipeRight = UISwipeGestureRecognizer.init(target: self, action: #selector(swipeRightSide))
        swipeRight.direction = .right
        SideMenuView.toView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer.init(target: self, action: #selector(onTap))
        swipeLeft.direction = .left
        SideMenuView.toView.addGestureRecognizer(swipeLeft)
        
    }
    
    // MARK: Right swipe on menu call
    @objc func swipeRightSide() {
        SideMenuView.open(toView: SideMenuView.toView)
    }
    
    // MARK: Tap on menu call
    @objc func onTap() {
        SideMenuView.close(toView: SideMenuView.toView)
    }
    
    // MARK: Add sidemenu
    static func add(toVC: UIViewController, toView: UIView) {
        let sideMenuView = Bundle.main.loadNibNamed("SideMenu", owner: self, options: nil)?[0] as! SideMenuView
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(sideMenuView)
        SideMenuView.toView = toView
    }
   
    // MARK: Open sidemenu
    static func open(toView: UIView) {
        SideMenuView.isOpen = true
        toView.addSubview(SideMenuView.trasparentView)
        UIView.animate(withDuration: 0.3) {
            SideMenuView.sideMenu.frame = CGRect(x: 0, y: 0, width: toView.frame.size.width * 0.7, height: Device.screenHeight)
            toView.frame = CGRect(x: SideMenuView.sideMenu.frame.width, y: 0, width: Device.screenWidth, height: Device.screenHeight)
        }
    }
    
    // MARK: Close sidemenu
    static func close(toView: UIView) {
        SideMenuView.isOpen = false
        SideMenuView.trasparentView.removeFromSuperview()
        
        UIView.animate(withDuration: 0.3) {
            SideMenuView.sideMenu.frame = CGRect(x: -(Device.screenWidth - SideMenuView.menuSize), y: 0, width: Device.screenWidth - SideMenuView.menuSize, height: Device.screenHeight)
            toView.frame = CGRect(x: 0, y: 0, width: Device.screenWidth, height: Device.screenHeight)
        }
    }
    
    //    MARK:- IBAction
    
    @IBAction func btnHomeTapped(_ sender: Any) {
        SideMenuView.delegate?.btnHomeTapped()
    }
    @IBAction func btnProfileTapped(_ sender: Any) {
        SideMenuView.delegate?.btnProfileTapped()
    }
    @IBAction func btnRegisterAsProviderTapped(_ sender: Any) {
        SideMenuView.delegate?.btnRegisterAsProviderTapped()
    }
    @IBAction func btnContactUsTapped(_ sender: Any) {
        SideMenuView.delegate?.btnContactUsTapped()
    }
    @IBAction func btnLogoutTapped(_ sender: Any) {
        SideMenuView.delegate?.btnLogoutTapped()
    }
}

protocol SideMenuViewDelegate {
    func btnHomeTapped()
    func btnProfileTapped()
    func btnRegisterAsProviderTapped()
    func btnContactUsTapped()
    func btnLogoutTapped()
}
