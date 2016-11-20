//
//  CSHBViewSubMenu.swift
//  SeungHoBack_C0663173_Assignment
//
//  Created by shoong on 2016-06-16.
//  Copyright © 2016 SnowBack. All rights reserved.
//

import Foundation

public let aryMenuText: [String] = [   "1. Display stock information with the lowest value",
                                       "2. Display stock with the highest value",
                                       "3. Display the most profitable stock",
                                       "4. Display the least profitable stock",
                                       "5. List all stocks sorted by company name(A-Z)",
                                       "6. List all stocks sorted by from the lowest value to the highest value" ]

class CSHBViewSubMenu: SHBPrintable {
    
    var aryPrintable : [SHBPrintable] = []
    
    func printMenu() {
        
        var inputData = 0
        
        while (inputData != aryPrintable.count) {
            
            print("\n\n\n")
            print("###################################################################")
            print("############              View Sub Menu                ############")
            print("###################################################################")
            for text in aryMenuText {
                print("##### \(text)")
            }
            print("##### 7. Return to View Menu")
            print("###################################################################")
            print(" Choose menu : ")
            
            inputData = input(aryPrintable.count)
            self.aryPrintable[inputData].printMenu()
        }
    }
}

class CSHBViewSubMenus: SHBPrintable {
    
    var menus_ : SHBMenus
    
    var nIndex_ = 0
    
    init (index: Int, menus: SHBMenus) {
        nIndex_ = index
        menus_ = menus
    }
    
    func printMenu() {
        
        print("\n\n\n")
        print("###################################################################")
        print("##### \(aryMenuText[nIndex_])")
        print("###################################################################")
        
        menus_.printSubMenus()
        
        print("Press any key to return View Sub Menu")
        input(0)
    }
}

class CSHBSubMenus1: SHBMenus {
    
    func printSubMenus() {
     
        CSHBStockManagement.singletonInstance.printDisplayValues(true, isAll: false)
    }
}

class CSHBSubMenus2: SHBMenus {
    
    func printSubMenus() {
        
        CSHBStockManagement.singletonInstance.printDisplayValues(false, isAll: false)
    }
}

class CSHBSubMenus3: SHBMenus {
    
    func printSubMenus() {
        
        CSHBStockManagement.singletonInstance.printDisplayProfitable(false)
    }
}

class CSHBSubMenus4: SHBMenus {
    
    func printSubMenus() {
        
        CSHBStockManagement.singletonInstance.printDisplayProfitable(true)
    }
}

class CSHBSubMenus5: SHBMenus {
    
    func printSubMenus() {
        
        CSHBStockManagement.singletonInstance.printDisplayCompanyName(true)
    }
}

class CSHBSubMenus6: SHBMenus {
    
    func printSubMenus() {
        
        CSHBStockManagement.singletonInstance.printDisplayValues(true, isAll: true)
    }
}