//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Pavel Shabliy on 29.06.2023.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    @IBOutlet weak var thirdScreenButtonsCollection: UICollectionView!
    
    var dictionaryButtonsData = DictionaryButtonsData()
    var arrayOfNames = [String]()
    var dictionaryOfNames = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        appendDataToArray(&arrayOfNames)
        appendDataToDictionary(dictionary: &dictionaryOfNames)
    }
    
    func appendDataToArray(_ array: inout [String]) {
            for index in 1...10_000_000 {
                array.append("Name\(index)")
            }
        }
    
    func appendDataToDictionary(dictionary: inout [String:String]) {
        for value in 1...10_000_000 {
            dictionary["Name\(value)"] = String(value)
        }
    }
    
    func configUI() {
        thirdScreenButtonsCollection.register(UINib(nibName: "DictionaryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DictionaryCollectionViewCell")
    }
    
}

extension DictionaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dictionaryButtonsData.buttonTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DictionaryCollectionViewCell", for: indexPath) as? DictionaryCollectionViewCell else { return UICollectionViewCell() }
        cell.buttonName.text =  dictionaryButtonsData.buttonTitles[indexPath.row]
        return cell
    }
    
}

extension DictionaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsInLine = 2
        let cellFrame = collectionView.frame
        let widthCell = cellFrame.width / CGFloat(cellsInLine)
        let heightCell = widthCell / 2
        let offset: CGFloat = 2
        let spacing = CGFloat(cellsInLine + 1) * offset / CGFloat(cellsInLine)
        
        return CGSize(width: widthCell - spacing, height: heightCell - (offset * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! DictionaryCollectionViewCell

        switch indexPath.row {
        case 0:
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.dictionaryButtonsData.measureExecutionTime {
                        self.dictionaryButtonsData.findFirstArrayElement(array: self.arrayOfNames)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
        case 1:
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.dictionaryButtonsData.measureExecutionTime {
                        self.dictionaryButtonsData.findFirstDictionaryElement(dictionary: self.dictionaryOfNames)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
        case 2:
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.dictionaryButtonsData.measureExecutionTime {
                        self.dictionaryButtonsData.findLastArrayElement(array: self.arrayOfNames)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
        case 3:
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.dictionaryButtonsData.measureExecutionTime {
                        self.dictionaryButtonsData.findLastDictionaryElement(dictionary: self.dictionaryOfNames)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
        case 4:
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.dictionaryButtonsData.measureExecutionTime {
                        self.dictionaryButtonsData.searchNonExistingElementOfArray(array: self.arrayOfNames)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
        case 5:
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.dictionaryButtonsData.measureExecutionTime {
                        self.dictionaryButtonsData.searchNonExistingElementOfDictionary(dictionary: self.dictionaryOfNames)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
        default:
            cell.cellTappedAction = nil
        }
    }
}
