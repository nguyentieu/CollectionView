//
//  SecondViewController.swift
//  CollectionView
//
//  Created by nguyenos on 10/29/17.
//  Copyright © 2017 Nguyen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var name = ""
    var image : UIImage = #imageLiteral(resourceName: "Back Button")
    
    @IBOutlet weak var secondViewImage: UIImageView!
    @IBOutlet weak var secondVCLabel: UILabel!
    @IBAction func back(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        secondVCLabel.text = "Ảnh số \(name)"
        secondViewImage.image = image
    }


}
