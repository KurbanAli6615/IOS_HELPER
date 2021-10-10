//
//  ProductDetailsViewController.swift
//  Clown
//
//  Created by Sapphire on 10/06/21.
//

import UIKit
import ImageSlideshow

class ProductDetailsViewController: UIViewController {

    
    @IBOutlet weak var imageSlideShow: ImageSlideshow!
    @IBOutlet weak var descriptionIndicator: UIView!
    @IBOutlet weak var productDetailsIndicator: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var showTabBarOnPop: Bool = false
    
    var quantityOfProduct = 01
    let productImageArray = [BundleImageSource(imageString: "car"),BundleImageSource(imageString: "email"),BundleImageSource(imageString: "toys"),BundleImageSource(imageString: "tire")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        setupUI()
    }
    
    func setupUI(){
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.black
        pageIndicator.pageIndicatorTintColor = UIColor.lightGray
        imageSlideShow.pageIndicator = pageIndicator
        
        imageSlideShow.setImageInputs(productImageArray)
        imageSlideShow.slideshowInterval = 2.0
        imageSlideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
      
        quantityLabel.text = String(format: "%02d", quantityOfProduct)
    }

    @IBAction func descriptionButtonTapped(_ sender: Any) {
        textView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        descriptionIndicator.backgroundColor = UIColor(named: "themeMain")
        productDetailsIndicator.backgroundColor = UIColor(named: "themeGrey")
    }
    @IBAction func productDetailButtonTapped(_ sender: Any) {
        textView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        descriptionIndicator.backgroundColor = UIColor(named: "themeGrey")
        productDetailsIndicator.backgroundColor = UIColor(named: "themeMain")
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        if showTabBarOnPop{
            self.tabBarController?.tabBar.isHidden = false
            navigationController?.popViewController(animated: true)
        }else {
            navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func increseQuantity(_ sender: Any) {
        quantityOfProduct += 1
        quantityLabel.text = String(format: "%02d", quantityOfProduct)
    }
    @IBAction func decreseQuantity(_ sender: Any) {
        if (quantityOfProduct > 0){
            quantityOfProduct -= 1
            quantityLabel.text = String(format: "%02d", quantityOfProduct)
        }
    }
    @IBAction func cartButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "AddToBagViewController") as! AddToBagViewController
        vc.hideTabbarWhenScreenPop = true
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
