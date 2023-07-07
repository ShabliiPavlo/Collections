//
//  ArrayViewController.swift
//  Collections
//
//  Created by Pavel Shabliy on 29.06.2023.
//

import UIKit

class ArrayViewController: UIViewController {
    
    @IBOutlet weak var createArreyButton: UIButton!
    @IBOutlet weak var createArreyIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var collectionOfButtoms: UICollectionView!
    
    let arrayData = ButtomsData()
    var arrayOfInt = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @IBAction func createArreyButtomPressed(_ sender: UIButton) {
        
        createArreyIndicator.startAnimating()
        createArreyButton.setTitle("", for: .normal)
        
        DispatchQueue.global().async {
            let result = self.arrayData.measureExecutionTime {
                self.arrayOfInt = Array(0..<10_000_000)
            }
            
            DispatchQueue.main.async {
                self.createArreyButton.setTitle(result, for: .normal)
                self.collectionOfButtomsIsAppears()
            }
        }
    }
    
    func collectionOfButtomsIsAppears() {
        collectionOfButtoms.isHidden = false
        createArreyIndicator.stopAnimating()
    }
    
    func configureUI() {
        let nib = UINib(nibName: "ButtomsCollectionViewCell", bundle: nil)
        collectionOfButtoms.register(nib, forCellWithReuseIdentifier: "ButtomsCollectionViewCell")
    }
}

extension ArrayViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayData.arrayOfButtomsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtomsCollectionViewCell", for: indexPath) as? ButtomsCollectionViewCell else { return UICollectionViewCell() }
        let buttomTittle = arrayData.arrayOfButtomsNames
        cell.calculateButtom.setTitle(buttomTittle[indexPath.row], for: .normal)
        
        switch indexPath.row {
        case 0:
            cell.buttonTappedAction = {
                cell.loadIndicator.startAnimating()
                cell.calculateButtom.setTitle("", for: .normal)
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.insertAtBeginningOneByOne(array: &self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.calculateButtom.setTitle(result, for: .normal)
                        cell.loadIndicator.stopAnimating()
                    }
                }
            }
        case 1:
            cell.buttonTappedAction = {
            }
            
        default:
            cell.buttonTappedAction = nil
        }
        
        return cell
    }
}

extension ArrayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsInLine = 2
        let cellFrame = collectionView.frame
        let widthCell = cellFrame.width / CGFloat(cellsInLine)
        let heightCell = widthCell / 2
        let offset: CGFloat = 2
        let spacing = CGFloat(cellsInLine + 1) * offset / CGFloat(cellsInLine)
        
        return CGSize(width: widthCell - spacing, height: heightCell - (offset * 2))
    }
}
