//
//  DummyVC.swift
//  ShobaikLobaik
//
//  Created by PC103-PC on 06/10/21.
//

import UIKit

class DummyVC: UIViewController {

    @IBOutlet weak var segmentControl   : UISegmentedControl!
    @IBOutlet weak var containerView    : UIView!
    
    
    private lazy var firstViewController: FVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "fvc") as! FVC

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)

        return viewController
    }()

    private lazy var secondViewController: SVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "svc") as! SVC

        self.add(asChildViewController: viewController)

        return viewController
    }()
    
    override func viewDidLoad() {
           super.viewDidLoad()
           self.setupView()
       }
    
    func setupView() {
         updateView()
     }

    private func updateView() {
        if segmentControl.selectedSegmentIndex == 0 {
            self.remove(asChildViewController: secondViewController)
            add(asChildViewController: firstViewController)
        } else {
            self.remove(asChildViewController: firstViewController)
            add(asChildViewController: secondViewController)
        }
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
            updateView()
        }
    
    private func add(asChildViewController viewController: UIViewController) {

        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        containerView.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
}

class FVC: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FVC")
    }
}
class SVC: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SVC")
    }
}
