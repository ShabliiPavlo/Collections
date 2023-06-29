//
//  ViewController.swift
//  Collections
//
//  Created by Pavel Shabliy on 27.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionsTable: UITableView!
    
    let listOfCollectionsArray = ["Array","Dictionary","Set"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCollectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = listOfCollectionsArray[indexPath.row]
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCollection = listOfCollectionsArray[indexPath.row]
        
        var storyboardName: String
        switch selectedCollection {
        case "Array":
            storyboardName = "ArrayViewController"
            
        case "Dictionary":
            storyboardName = "DictionaryViewController"
        case "Set":
            storyboardName = "SetViewController"
        default:
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: storyboardName) as? ArrayViewController {
            vc.title = listOfCollectionsArray[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        } else if let vc = storyboard.instantiateViewController(withIdentifier: storyboardName) as? DictionaryViewController {
            vc.title = listOfCollectionsArray[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        } else if let vc = storyboard.instantiateViewController(withIdentifier: storyboardName) as? SetViewController {
            vc.title = listOfCollectionsArray[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

