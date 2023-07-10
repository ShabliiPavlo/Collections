//
//  ArrayData.swift
//  Collections
//
//  Created by Pavel Shabliy on 06.07.2023.
//

import Foundation

struct ButtonsData {
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
    
    func measureExecutionTime(task: () -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        task()
        let endTime = CFAbsoluteTimeGetCurrent()
        
        let executionTime = endTime - startTime
        return String(executionTime)
    }
    
    func insertAtBeginningOneByOne(array: inout [Int]) {
        for i in 0...999 {
            array.insert(i, at: 0)
        }
    }

    func insertAtBeginningAtOnce(array: inout [Int]) {
        let elementsToInsert = Array(0...999)
        array.insert(contentsOf: elementsToInsert, at: 0)
    }

    func insertInMiddleOneByOne(array: inout [Int]) {
        let middleIndex = array.count / 2
        for i in 0...999 {
            array.insert(i, at: middleIndex)
        }
    }

    func insertInMiddleAtOnce(array: inout [Int]) {
        let middleIndex = array.count / 2
        let elementsToInsert = Array(0...999)
        array.insert(contentsOf: elementsToInsert, at: middleIndex)
    }

    func appendToEndOneByOne(array: inout [Int]) {
        for i in 0...999 {
            array.append(array.count + i)
        }
    }

    func appendToEndAtOnce(array: inout [Int]) {
        let elementsToInsert = Array(array.count...(array.count + 999))
        array.append(contentsOf: elementsToInsert)
    }

    func removeFromBeginningOneByOne(array: inout [Int]) {
        for _ in 0...999 {
            array.remove(at: 0)
        }
    }

    func removeFromBeginningAtOnce(array: inout [Int]) {
        array.removeFirst(1000)
    }

    func removeFromMiddleOneByOne(array: inout [Int]) {
        let middleIndex = array.count / 2
        for _ in 0...999 {
            array.remove(at: middleIndex)
        }
    }

    func removeFromMiddleAtOnce(array: inout [Int]) {
        let middleIndex = array.count / 2
        array.removeSubrange(middleIndex..<(middleIndex + 1000))
    }

    func removeFromEndOneByOne(array: inout [Int]) {
        for _ in 0...999 {
            array.removeLast()
        }
    }

    func removeFromEndAtOnce(array: inout [Int]) {
        array.removeLast(1000)
    }

}
