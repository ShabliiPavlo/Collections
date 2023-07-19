//
//  DictionaryCollectionViewCell.swift
//  Collections
//
//  Created by Pavel Shabliy on 17.07.2023.
//

import UIKit

class DictionaryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var buttonName: UILabel!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    var cellTappedAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func updateBeforeCalculation() {
        loadIndicator.startAnimating()
        buttonName.text = ""
    }
    
    func updateAfterCalculation(title:String) {
        buttonName.text = title
        loadIndicator.stopAnimating()
    }
}
