//
//  TutorialViewController.swift
//  Food Daily
//
//  Created by PC103-PC on 04/10/21.
//

import UIKit

class TutorialViewController: UIViewController {


    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? WalkthroughPageController {
            tutorialPageViewController.tutorialDelegate = self
        }
    }
}

extension TutorialViewController: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(tutorialPageViewController: WalkthroughPageController,
        didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: WalkthroughPageController,
        didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
}
