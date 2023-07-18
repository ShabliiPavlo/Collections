//
//  File.swift
//  Collections
//
//  Created by Pavel Shabliy on 17.07.2023.
//

import Foundation

struct DictionaryButtonsData: MeasureExecutionTime {
    
    var buttonTitles = ["Find the first contact", "Find the first contact", "Find the last contac", "Find the last contac", "Searchfor a non-existing element", "Searchfor a non-existing element"]
    
    func findFirstArrayElement(array:[String]) {
        print(array.first ?? "Default")
    }
    
    func findFirstDictionaryElement(dictionary:[String:String]) {
        print(dictionary.first ?? "Default")
    }
    
    func findLastArrayElement(array:[String]) {
        print(array.last ?? "Default")
    }
    
    func findLastDictionaryElement(dictionary:[String:String]) {
        if let lastKey = dictionary.keys.max(by: { $0 < $1 }) {
            let lastValue = dictionary[lastKey]
            print("Last key: \(lastKey), Last value: \(lastValue ?? "")")
        } else {
            print("Dictionary is empty.")
        }
        
    }
    
    func searchNonExistingElementOfArray(array:[String]) {
        for index in array {
            if index != "Pasha" {
                print("Not found")
            } else {
                print("Found")
            }
        }
    }
    
    func searchNonExistingElementOfDictionary(dictionary:[String:String]) {
        for index in dictionary {
            if index.key != "Pasha" {
                print("Not found")
            } else {
                print("Found")
            }
        }
    }
    
}
