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
    
    @IBOutlet weak var allMatchingLabel: UILabel!
    @IBOutlet weak var allCharactersLabel: UILabel!
    @IBOutlet weak var allUniqueLabel: UILabel!
    
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
        allMatchingLabel.text = String(commonElements)
        allMatchingLabel.isHidden = false
        refreshSets()
    }
    @IBAction func allCharactersLableButton(_ sender: Any) {
        appendDataToSet()
        let uniqueElements = topTextFieldSet.symmetricDifference(bottomTextFieldSet)
        allCharactersLabel.text = String(uniqueElements)
        allCharactersLabel.isHidden = false
        refreshSets()
    }
    @IBAction func allUniqueLableButton(_ sender: Any) {
        appendDataToSet()
        let uniqueTopSetElements = topTextFieldSet.subtracting(bottomTextFieldSet)
        allUniqueLabel.text = String(uniqueTopSetElements)
        allUniqueLabel.isHidden = false
        refreshSets()
    }
    
    func refreshSets() {
         topTextFieldSet = []
         bottomTextFieldSet = []
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
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == topTextField {
            topText = textField.text ?? ""
        } else if textField == bottomTextField {
            bottomText = textField.text ?? ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        topTextField.resignFirstResponder()
        bottomTextField.resignFirstResponder()
        return true
    }
}
