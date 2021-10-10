//
//  FavoritesViewController.swift
//  Clown
//
//  Created by KurbanAli on 12/06/21.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favItemsCollectionView: UICollectionView!
    
    let imgArr = [UIImage(named: "car"),UIImage(named: "tire"),UIImage(named: "toys"),UIImage(named: "email")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favItemsCollectionView.delegate = self
        favItemsCollectionView.dataSource = self
        favItemsCollectionView.register(UINib(nibName: "FavItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FavItemCollectionViewCell")
    }
    @IBAction func logoTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cartButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "AddToBagViewController") as! AddToBagViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favItemsCollectionView.dequeueReusableCell(withReuseIdentifier: "FavItemCollectionViewCell", for: indexPath) as! FavItemCollectionViewCell
        cell.cellImage.image = imgArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (self.view.frame.size.width - 20) / 2, height: 200)
    }
}
