//
//  CSHBViewMenu.swift
//  SeungHoBack_C0663173_Assignment
//
//  Created by shoong on 2016-06-16.
//  Copyright © 2016 SnowBack. All rights reserved.
//

import Foundation

class CSHBViewMenu: SHBPrintable {
    
    var aryPrintable : [SHBPrintable] = []
    
    func printMenu() {
        
        var inputData = 0
        
        while (inputData != aryPrintable.count) {
            
            print("\n\n\n")
            print("###################################################################")
            print("############                  View Menu                ############")
            print("###################################################################")
            print("1. View All of the Stocks")
            print("2. View All of the ForeignStocks")
            print("3. Go to Sub menu")
            print("4. Return to Main Menu")
            print("###################################################################")
            print(" Choose menu : ")
            
            inputData = input(aryPrintable.count)
            self.aryPrintable[inputData].printMenu()
        }
    }
}

class CSHBViewAllDomesticStocks: SHBPrintable {
    
    func printMenu() {
        
        print("\n\n\n")
        print("###################################################################")
        print("#######              View All Domestic Stocks               #######")
        print("###################################################################")
        
        CSHBStockManagement.singletonInstance.printAllStocks(true)
        
        print("Press any key to return Insert Menu")
        input(0)
    }
}

class CSHBViewAllForeignStocks: SHBPrintable {
    
    func printMenu() {
        
        print("\n\n\n")
        print("###################################################################")
        print("#######              View All Foreign Stocks                #######")
        print("###################################################################")
        
        CSHBStockManagement.singletonInstance.printAllStocks(false)
        
        print("Press any key to return Insert Menu")
        input(0)
    }
}