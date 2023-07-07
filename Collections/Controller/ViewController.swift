//
//  ViewController.swift
//  Collections
//
//  Created by Pavel Shabliy on 27.06.2023.
//

import UIKit

enum CollectionType: String, CaseIterable {
    case array = "Array"
    case dictionary = "Dictionary"
    case set = "Set"
    
    var storyboardName: String {
        switch self {
        case .array:
            return "ArrayViewController"
        case .dictionary:
            return "DictionaryViewController"
        case .set:
            return "SetViewController"
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionsTable: UITableView!
    
    let listOfCollectionsArray = CollectionType.allCases
    
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
        cell.textLabel?.text = listOfCollectionsArray[indexPath.row].rawValue
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCollection = listOfCollectionsArray[indexPath.row]
        let storyboardName = selectedCollection.storyboardName
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: storyboardName) as? UIViewController {
            vc.title = selectedCollection.rawValue
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}




