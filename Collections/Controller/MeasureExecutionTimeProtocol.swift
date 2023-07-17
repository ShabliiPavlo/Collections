//
//  MeasureExecutionTimeProtocol.swift
//  Collections
//
//  Created by Pavel Shabliy on 17.07.2023.
//

import Foundation

protocol MeasureExecutionTime {
    func measureExecutionTime(task: () -> Void) -> String
}

extension MeasureExecutionTime {
    func measureExecutionTime(task: () -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        task()
        let endTime = CFAbsoluteTimeGetCurrent()
        
        let executionTime = endTime - startTime
        return String(executionTime)
    }
}
