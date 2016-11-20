//
//  CSHBRunMenu.swift
//  SeungHoBack_C0663173_Assignment
//
//  Created by shoong on 2016-06-16.
//  Copyright © 2016 SnowBack. All rights reserved.
//

import Foundation

class CSHBInsertMenu: SHBPrintable {
    
    var aryPrintable : [SHBPrintable] = []
    
    func printMenu() {
        
        var inputData = 0
        
        while (inputData != aryPrintable.count) {
            
            print("\n\n\n")
            print("###################################################################")
            print("############                 Insert Menu               ############")
            print("###################################################################")
            print("1. Insert a New Stock")
            print("2. Insert New Random Stocks (unitl 8 stocks)")
            print("3. Return to Main Menu")
            print("###################################################################")
            print(" Choose menu : ")
            
            inputData = input(aryPrintable.count)
            self.aryPrintable[inputData].printMenu()
        }
    }
}

class CSHBInsertNewStock: SHBPrintable {
    
    func printMenu() {
        
        var companyName: String = ""
        var purchasePrice: Float = 0.0
        var currentPrice: Float = 0.0
        var shares: Int32 = 0
        var conversionRate: Float = 0.0

        print("\n\n\n")
        print("############          Insert a New Stock               ############")
        
        while (true) {
            print("Input Company Name : ")
            companyName = inputNewStock()
            if (true == CSHBStockManagement.singletonInstance.checkCompanyName(companyName)) {
                
                print("this company name(\(companyName)) is already exist!!!")
                continue
            }
            else {
                break
            }
        }
        
        while(true) {
            print("Input purchase price : ")
            
            if let data: Float = inputNewStock() {
            
                purchasePrice = data
                break
            }
            else {
                print("Try to input again !!!")
            }
        }
        
        while(true) {
            print("Input current price : ")
            
            if let data: Float = inputNewStock() {
                
                currentPrice = data
                break
            }
            else {
                print("Try to input again !!!")
            }
        }
        
        while(true) {
            print("Input number of shares : ")
            
            if let data: Int32 = input() {
                
                shares = data
                break
            }
            else {
                print("Try to input again !!!")
            }
        }
        
        while(true) {
            print("Input conversion rate : (if this value is not 0, this stock will be generated to new foreign stock")
            
            if let data: Float = inputNewStock() {
                
                conversionRate = data
                break
            }
            else {
                print("Try to input again !!!")
            }
        }
                
        CSHBStockManagement.singletonInstance.addNewStock(companyName, purchasePrice: purchasePrice, currentPrice: currentPrice, shares: shares, rate: conversionRate)
    }
}

class CSHBInsertAllStock: SHBPrintable {
    
    func printMenu() {
        
        print("\n\n\n")
        print("###################################################################")
        print("#######                  Insert All Stocks                  #######")
        print("#######    automatically generate stocks until maximum 8    #######")
        print("###################################################################")
        
        CSHBStockManagement.singletonInstance.addAllStocks()
        
        print("Press any key to return Insert Menu")
        input(0)
    }
}

