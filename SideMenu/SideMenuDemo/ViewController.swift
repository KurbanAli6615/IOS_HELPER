//
//  ViewController.swift
//  SideMenuDemo
//
//  Created by PC103-PC on 05/10/21.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SideMenuView.delegate = self

        // Do any additional setup after loading the view.
        SideMenuView.add(toVC:self, toView: self.view )
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SideMenuView.add(toVC:self, toView: self.view )
        SideMenuView.btnIndex = 1
    }
    
    @IBAction func btnSidMenuClicked(_ sender: Any) {
        if SideMenuView.isOpen {
            SideMenuView.close(toView: self.view)
            SideMenuView.isOpen = !SideMenuView.isOpen
        } else {
            SideMenuView.open(toView: self.view)
            SideMenuView.isOpen = !SideMenuView.isOpen
            
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case .right:
                SideMenuView.close(toView: self.view)
            case .down:
                print("Swiped down")
            case .left:
                SideMenuView.close(toView: self.view)
            case .up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
}

extension ViewController: SideMenuDelegate {
    
    func btn1Clciked() {
        print("Btn1 clicked")
    }
    
    func btn2Clicked() {
        print("Btn2 clicked")
    }
    
    func btn3Clciked() {
        print("Btn3 clicked")
    }
    
    
}
