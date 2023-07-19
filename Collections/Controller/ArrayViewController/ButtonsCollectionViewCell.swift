//
//  ButtonsCollectionViewCell.swift
//  Collections
//
//  Created by Pavel Shabliy on 05.07.2023.
//

import UIKit

class ButtonsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet private weak var loadIndicator: UIActivityIndicatorView!
    
    var buttonTappedAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        buttonTappedAction?()
    }
    
    func updateBeforeCalculation() {
        loadIndicator.startAnimating()
        calculateButton.setTitle("", for: .normal)
    }
    
    func updateAfterCalculation(title:String) {
        calculateButton.setTitle(title, for: .normal)
        loadIndicator.stopAnimating()
    }
}
