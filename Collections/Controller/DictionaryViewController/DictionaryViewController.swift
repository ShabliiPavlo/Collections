//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Pavel Shabliy on 29.06.2023.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    @IBOutlet weak var thirdScreenButtonsCollection: UICollectionView!
    
    let dictionaryButtonsData = DictionaryButtonsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DictionaryCollectionViewCell", for: indexPath) as! DictionaryCollectionViewCell
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
        cell.buttonName.text = "lol"
    }
}
