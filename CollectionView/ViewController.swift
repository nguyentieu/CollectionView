//
//  ViewController.swift
//  CollectionView
//
//  Created by Nguyen on 10/26/17.
//  Copyright © 2017 Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var demoCollectionView: UICollectionView!
    var i = 0;
    var data = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "15", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50"]
    var img : [UIImage] = [#imageLiteral(resourceName: "chimcanhcut"),#imageLiteral(resourceName: "chimcanhcut2")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        demoCollectionView.dataSource = self
        demoCollectionView.delegate = self
        demoCollectionView.isPagingEnabled = true
        
        demoCollectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        if let demoCollectionViewFlowLayout = demoCollectionView.collectionViewLayout as?
        UICollectionViewFlowLayout {
            if i  == 1 {
                demoCollectionViewFlowLayout.scrollDirection = .vertical
            } else if i == 0 {
                demoCollectionViewFlowLayout.scrollDirection = .horizontal
            }
            
            demoCollectionViewFlowLayout.itemSize = CGSize.init(width: view.bounds.width / 4 , height: 200)
            demoCollectionViewFlowLayout.minimumLineSpacing = 5
            demoCollectionViewFlowLayout.minimumInteritemSpacing = 5
        }
    }
    
    @IBAction func xoay(_ sender: UIButton) {
        if i == 0 {
            i = 1
        } else if i == 1 {
             i = 0
        }
        viewDidLoad()
    }
}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell () }
        
        
        cell.configCell( data[indexPath.item], index: indexPath.item )
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {

   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        secondViewController.name = data[indexPath.item]
        secondViewController.image = img[indexPath.item % 2]
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.layer.bounds.width / 4 , height: 100)
    }
}
