//
//  HomeViewController.swift
//  forgotPasswordDesign
//
//  Created by Sapphire on 08/06/21.
//

import UIKit
import ImageSlideshow
class HomeViewController: UIViewController{
    
    // MARK:-  IBOutlet
    @IBOutlet weak var featuredProductCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var slideShowView: ImageSlideshow!
    @IBOutlet weak var searchTextField: UITextField!
    
    // MARK:-  Vars
    
    
    let imageArray = [BundleImageSource(imageString: "slider1"),BundleImageSource(imageString: "slider2"),BundleImageSource(imageString: "slider3"),BundleImageSource(imageString: "slider4")]
    
    let colorArray = [UIColor.systemPink, UIColor.systemBlue, UIColor.green]
    
    let cellImages = [UIImage(named: "HOME1"),UIImage(named: "HOME3"),UIImage(named: "HOME2")]
    
    let featuredCellImages = [UIImage(named: "toys"),UIImage(named: "tire"),UIImage(named: "car")]
    // MARK:-  View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    // MARK:-  Halper Function
    
    func setupUI(){
        searchTextField.setIcon(UIImage(named: "glass")!)
        
        //        MainUi Setup
        slideShowView.setImageInputs(imageArray)
        slideShowView.slideshowInterval = 2.0
        slideShowView.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideShowView.contentScaleMode = UIViewContentMode.scaleToFill
        slideShowView.pageIndicator = nil
        
        //       Category CollectionView Setup
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: "HomeCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoryCollectionViewCell")
        
//        Featured collectionview setup
        featuredProductCollectionView.delegate = self
        featuredProductCollectionView.dataSource = self
        featuredProductCollectionView.register(UINib(nibName: "FeaturedProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeaturedProductsCollectionViewCell")
    }
    @IBAction func cartButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "AddToBagViewController") as! AddToBagViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK:-  Extensions

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == categoryCollectionView){
            return 3
        }else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        if (collectionView == categoryCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCollectionViewCell", for: indexPath) as! HomeCategoryCollectionViewCell
            cell.cellView.backgroundColor = colorArray[indexPath.row]
            cell.cellImage.image = cellImages[indexPath.row]
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductsCollectionViewCell", for: indexPath) as! FeaturedProductsCollectionViewCell
            cell.cellImage.image = featuredCellImages[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if (collectionView == categoryCollectionView){
            let viewSize = self.view.frame.size.width - 40
            return CGSize(width: viewSize / 3, height: 140)
        }else {
            return CGSize(width: 130, height: 166)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == featuredProductCollectionView){
            let destination = storyboard?.instantiateViewController(identifier: "ProductDetailsViewController") as! ProductDetailsViewController
                
            destination.showTabBarOnPop = true
            navigationController?.pushViewController(destination, animated: true)
        }
    }
}

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                                    CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                                                CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
