//
//  ArrayViewController.swift
//  Collections
//
//  Created by Pavel Shabliy on 29.06.2023.
//

import UIKit

class ArrayViewController: UIViewController {
    
    @IBOutlet private weak var createArreyButton: UIButton!
    @IBOutlet private weak var createArreyIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var collectionOfButtons: UICollectionView!
    
    let arrayData = ArrayButtonsData()
    var arrayOfInt = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @IBAction func createArreyButtonPressed(_ sender: UIButton) {
        
        createArreyIndicator.startAnimating()
        createArreyButton.setTitle("", for: .normal)
        
        DispatchQueue.global().async {
            let result = self.arrayData.measureExecutionTime {
                self.arrayOfInt = Array(0..<10_000_000)
            }
            
            DispatchQueue.main.async {
                self.createArreyButton.setTitle(result, for: .normal)
                self.collectionOfButtonsIsAppears()
            }
        }
    }
    
    func collectionOfButtonsIsAppears() {
        collectionOfButtons.isHidden = false
        createArreyIndicator.stopAnimating()
    }
    
    func configureUI() {
        let nib = UINib(nibName: "ButtonsCollectionViewCell", bundle: nil)
        collectionOfButtons.register(nib, forCellWithReuseIdentifier: "ButtonsCollectionViewCell")
    }
}

extension ArrayViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayData.arrayOfButtonsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonsCollectionViewCell", for: indexPath) as? ButtonsCollectionViewCell else { return UICollectionViewCell() }
        
        
        
        let buttonTittle = arrayData.arrayOfButtonsNames
        cell.calculateButton.setTitle(buttonTittle[indexPath.row], for: .normal)
        
        switch indexPath.row {
        case 0:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.insertAtBeginningOneByOne(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 1:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.insertInMiddleOneByOne(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 2:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.insertElementsAtEndOneByOne(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 3:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.removeElementsFromBeginningOneByOne(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 4:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.removeElementsFromMiddleOneByOne(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 5:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.removeElementsFromEndOneByOne(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 6:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.insertElementsAtBeginningAtOnce(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 7:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.insertElementsAtMiddleAtOnce(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 8:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.insertElementsAtEndAtOnce(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 9:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.removeElementsFromBeginningAtOnce(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 10:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.removeElementsFromMiddleAtOnce(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
            }
        case 11:
            cell.buttonTappedAction = {
                cell.updateBeforeCalculation()
                DispatchQueue.global().async {
                    let result = self.arrayData.measureExecutionTime {
                        self.arrayData.removeElementsFromEndAtOnce(array: self.arrayOfInt)
                    }
                    DispatchQueue.main.async {
                        cell.updateAfterCalculation(title:result)
                    }
                }
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
