//
//  SetViewController.swift
//  Collections
//
//  Created by Pavel Shabliy on 29.06.2023.
//

import UIKit

class SetViewController: UIViewController {

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var allMatchingLable: UILabel!
    @IBOutlet weak var allCharactersLable: UILabel!
    @IBOutlet weak var allUniqueLable: UILabel!
    
    var topTextFieldSet: Set<Character> = []
    var bottomTextFieldSet: Set<Character> = []
    var topText = ""
    var bottomText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func allMatchingLableButton(_ sender: Any) {
        appendDataToSet()
        let commonElements = topTextFieldSet.intersection(bottomTextFieldSet)
        allMatchingLable.text = String(commonElements)
        allMatchingLable.isHidden = false
    }
    @IBAction func allCharactersLableButton(_ sender: Any) {
        appendDataToSet()
        let uniqueElements = topTextFieldSet.symmetricDifference(bottomTextFieldSet)
        allCharactersLable.text = String(uniqueElements)
        allCharactersLable.isHidden = false
    }
    @IBAction func allUniqueLableButton(_ sender: Any) {
        appendDataToSet()
        let uniqueTopSetElements = topTextFieldSet.subtracting(bottomTextFieldSet)
        allUniqueLable.text = String(uniqueTopSetElements)
        allUniqueLable.isHidden = false
    }
    
    func appendDataToSet() {
        for litera in topText {
            topTextFieldSet.insert(litera)
        }
        
        for litera in bottomText {
            bottomTextFieldSet.insert(litera)
        }
    }
}

extension SetViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == topTextField {
            topText = textField.text ?? ""
        } else if textField == bottomTextField {
            bottomText = textField.text ?? ""
        }
        return true
    }
}
