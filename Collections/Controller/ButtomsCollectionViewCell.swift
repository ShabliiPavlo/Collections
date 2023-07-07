//
//  ButtomsCollectionViewCell.swift
//  Collections
//
//  Created by Pavel Shabliy on 05.07.2023.
//

import UIKit

class ButtomsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var calculateButtom: UIButton!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    var buttonTappedAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        calculateButtom.addTarget(self, action: #selector(calculateButtomPressed), for: .touchUpInside)
    }
    
    @IBAction func calculateButtomPressed(_ sender: Any) {
        buttonTappedAction?()
    }
}
