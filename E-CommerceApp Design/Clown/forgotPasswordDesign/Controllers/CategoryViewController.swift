//
//  CategoryViewController.swift
//  Clown
//
//  Created by Sapphire on 09/06/21.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var itemsCollectionView: UICollectionView!
    @IBOutlet weak var itemsTableView: UITableView!
    
    @IBOutlet weak var chnageViewButtonOutlet: UIButton!
    
    let productImages = [UIImage(named: "toys"),UIImage(named: "tire"),UIImage(named: "car"),UIImage(named: "toys"),UIImage(named: "tire"),UIImage(named: "car"),UIImage(named: "toys"),UIImage(named: "tire"),UIImage(named: "car")]
    
    var isCollectionViewHidden: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        itemsCollectionView.isHidden = false
        itemsTableView.isHidden = true
        chnageViewButtonOutlet.setImage(UIImage(named: "table"), for: .normal)
        
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        itemsCollectionView.register(UINib(nibName: "FeaturedProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeaturedProductsCollectionViewCell")
        
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
        itemsTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }

    // MARK:-  IBActions

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false

    }
    @IBAction func chnageViewButtonPressed(_ sender: Any) {
        if isCollectionViewHidden {
            itemsCollectionView.isHidden = true
            itemsTableView.isHidden = false
            chnageViewButtonOutlet.setImage(UIImage(named: "collection"), for: .normal)
            isCollectionViewHidden = !isCollectionViewHidden
           
        }else {
            itemsTableView.isHidden = true
            itemsCollectionView.isHidden = false
            chnageViewButtonOutlet.setImage(UIImage(named: "table"), for: .normal)
            isCollectionViewHidden = !isCollectionViewHidden
        }
    }
    @IBAction func sortButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CustomPresentationController") as! CustomPresentationController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func cartButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "AddToBagViewController") as! AddToBagViewController
        vc.hideTabbarWhenScreenPop = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemsCollectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductsCollectionViewCell", for: indexPath) as! FeaturedProductsCollectionViewCell
        cell.cellImage.image = productImages[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ProductDetailsViewController") as! ProductDetailsViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Int((itemsCollectionView.layer.frame.size.width - 40 ) / 2), height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate{
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemsTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        cell.cellImage.image = productImages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ProductDetailsViewController") as! ProductDetailsViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
