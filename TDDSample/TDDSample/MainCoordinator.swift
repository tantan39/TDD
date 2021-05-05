//
//  MainCoordinator.swift
//  TDDSample
//
//  Created by Tan Tan on 5/4/21.
//

import UIKit

class MainCoordinator {
    var navigationController = UINavigationController()
    
    func start() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        guard let viewController = storyboard.instantiateInitialViewController() as? ViewController else { fatalError("Not found ViewController in Main storyboard")
        }
        
        viewController.pictureSelection = { [weak self] value in
            self?.showDetail(for: value)
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showDetail(for fileName: String) {
        let detailVC = DetailViewController()
        detailVC.selectedImage = fileName
        
        navigationController.pushViewController(detailVC, animated: true)
    }
    
}
