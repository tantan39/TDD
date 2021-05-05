//
//  DetailViewController.swift
//  TDDSample
//
//  Created by Tan Tan on 5/4/21.
//

import UIKit

class DetailViewController: UIViewController {
    let imageView = UIImageView()
    var selectedImage: String?
    
    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }
    
    override func viewDidLoad() {
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
}
