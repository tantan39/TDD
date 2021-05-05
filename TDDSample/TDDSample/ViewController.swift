//
//  ViewController.swift
//  TDDSample
//
//  Created by Tan Tan on 5/4/21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var pictureSelection: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        let fm = FileManager()
        let resourcePath = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: resourcePath)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Storm Viewer"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        cell?.textLabel?.text = pictures[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailViewController()
//        vc.selectedImage = pictures[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
        
        pictureSelection?(pictures[indexPath.row])
    }
}


