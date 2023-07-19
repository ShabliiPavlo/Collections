//
//  ArrayData.swift
//  Collections
//
//  Created by Pavel Shabliy on 06.07.2023.
//

import Foundation

struct ArrayButtonsData: MeasureExecutionTime {
    let arrayOfButtonsNames = [
        "Insert 1000 elements at the begining of the array one-by-one",
        "Insert 1000 elements at the middle of the array one-by-one",
        "Insert 1000 elements at the end of the array one-by-one",
        "Remove 1000 elements at the begining of the array one-by-one",
        "Remove1000 elements at the middle of the array one-by-one",
        "Remove 1000 elements at the end of the array one-by-one",
        "Insert 1000 elements at the begining of the array",
        "Insert 1000 elements at the middle of the array",
        "Insert 1000 elements at the end of the array",
        "Remove 1000 elements at the begining of the array",
        "Remove1000 elements at the middle of the array",
        "Remove 1000 elements at the end of the array"
    ]
    
    func insertAtBeginningOneByOne(array: [Int])  {
        var modifiedArray = array
        
        for i in 0...999 {
            modifiedArray.insert(i, at: 0)
        }
    }
    
    func insertAtBeginningAtOnce(array: [Int]) {
        var modifiedArray = array
        
        let elementsToInsert = Array(0...999)
        modifiedArray.insert(contentsOf: elementsToInsert, at: 0)
        
    }
    
    func insertInMiddleOneByOne(array: [Int])  {
        var modifiedArray = array
        
        let middleIndex = array.count / 2
        for i in 0...999 {
            modifiedArray.insert(i, at: middleIndex)
        }
        
    }
    
    func insertElementsAtBeginningOneByOne(array: [Int]) {
        var modifiedArray = array
        
        for i in 0...999 {
            modifiedArray.insert(i, at: 0)
        }
    }
    
    func insertElementsAtBeginningAtOnce(array: [Int]) {
        var modifiedArray = array
        
        let elementsToInsert = Array(0...999)
        modifiedArray.insert(contentsOf: elementsToInsert, at: 0)
    }
    
    func insertElementsAtMiddleOneByOne(array: [Int]) {
        var modifiedArray = array
        
        let middleIndex = array.count / 2
        for i in 0...999 {
            modifiedArray.insert(i, at: middleIndex)
        }
    }
    
    func insertElementsAtMiddleAtOnce(array: [Int]) {
        var modifiedArray = array
        
        let middleIndex = modifiedArray.count / 2
        let elementsToInsert = Array(0...999)
        modifiedArray.insert(contentsOf: elementsToInsert, at: middleIndex)
    }
    
    func insertElementsAtEndOneByOne(array: [Int]) {
        var modifiedArray = array
        
        for i in 0...999 {
            modifiedArray.append(modifiedArray.count + i)
        }
    }
    
    func insertElementsAtEndAtOnce(array: [Int]) {
        var modifiedArray = array
        
        let elementsToInsert = Array(modifiedArray.count...(modifiedArray.count + 999))
        modifiedArray.append(contentsOf: elementsToInsert)
    }
    
    func removeElementsFromBeginningOneByOne(array: [Int]) {
        var modifiedArray = array
        
        for _ in 0...999 {
            modifiedArray.remove(at: 0)
        }
    }
    
    func removeElementsFromBeginningAtOnce(array: [Int]) {
        var modifiedArray = array
        
        modifiedArray.removeFirst(1000)
    }
    
    func removeElementsFromMiddleOneByOne(array: [Int]) {
        var modifiedArray = array
        
        let middleIndex = modifiedArray.count / 2
        for _ in 0...999 {
            modifiedArray.remove(at: middleIndex)
        }
    }
    
    func removeElementsFromMiddleAtOnce(array: [Int]) {
        var modifiedArray = array
        
        let middleIndex = array.count / 2
        modifiedArray.removeSubrange(middleIndex..<(middleIndex + 1000))
    }
    
    func removeElementsFromEndOneByOne(array: [Int]) {
        var modifiedArray = array
        
        for _ in 0...999 {
            modifiedArray.removeLast()
        }
    }
    
    func removeElementsFromEndAtOnce(array: [Int]) {
        var modifiedArray = array
        
        modifiedArray.removeLast(1000)
    }
}
