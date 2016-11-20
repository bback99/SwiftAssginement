//
//  SHBUtilities.swift
//  SeungHoBack_C0663173_Assignment
//
//  Created by shoong on 2016-06-15.
//  Copyright © 2016 SnowBack. All rights reserved.
//

import Foundation

public func input(range: Int) -> Int {
        
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = NSString(data: keyboard.availableData, encoding: NSUTF8StringEncoding) as! String
        
    if let idx = inputData.characters.indexOf("\n") {
            
        inputData.removeAtIndex(idx)
    }
    if let ret = Int(inputData) {
        
        if ret < range {
            return ret
        }
    }
    return 0
}

public func input() -> Int32 {
    
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = NSString(data: keyboard.availableData, encoding: NSUTF8StringEncoding) as! String
    
    if let idx = inputData.characters.indexOf("\n") {
        
        inputData.removeAtIndex(idx)
    }
    return Int32(inputData)!
}

public func inputNewStock() -> String {
    
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = NSString(data: keyboard.availableData, encoding: NSUTF8StringEncoding) as! String
    
    if let idx = inputData.characters.indexOf("\n") {
        
        inputData.removeAtIndex(idx)
    }
    return String(inputData)
}

public func inputNewStock() -> Float {
    
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = NSString(data: keyboard.availableData, encoding: NSUTF8StringEncoding) as! String
    
    if let idx = inputData.characters.indexOf("\n") {
        
        inputData.removeAtIndex(idx)
    }
    return Float(inputData)!
}

public func formatStock(string: String, fieldWidth: Int) -> String {
    
    var ret_string = string
    let spaces: Int = fieldWidth - ret_string.characters.count
    let padding = String(count: spaces, repeatedValue: Character(" "))
    ret_string += padding
    return ret_string
}

func *(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByMultiplyingBy(right)
}
