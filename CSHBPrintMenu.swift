//
//  CSHBPrintMenu.swift
//  SeungHoBack_C0663173_Assignment
//
//  Created by shoong on 2016-06-14.
//  Copyright © 2016 SnowBack. All rights reserved.
//

import Foundation

class CSHBPrintMenu {
    
    let mainMenu_ = CSHBMainMenu()
    let insertMenu_ = CSHBInsertMenu()
    let viewMenu_ = CSHBViewMenu()
    let viewSubMenu_ = CSHBViewSubMenu()
    var viewSubMenus_: [CSHBViewSubMenus] = []
    let errorMenu_ = CSHBErrorMenu()
    
    var subMenus_: [SHBMenus] = [CSHBSubMenus1(), CSHBSubMenus2(), CSHBSubMenus3(), CSHBSubMenus4(), CSHBSubMenus5(), CSHBSubMenus6()]
    
    init() {
        
        for index in 0...5 {
            viewSubMenus_.append(CSHBViewSubMenus(index: index, menus: subMenus_[index]))
        }
        
        mainMenu_.aryPrintable      = [errorMenu_, insertMenu_, viewMenu_, CSHBMainMenuExit()]
        insertMenu_.aryPrintable    = [errorMenu_, CSHBInsertNewStock(), CSHBInsertAllStock(), mainMenu_]
        viewMenu_.aryPrintable      = [errorMenu_, CSHBViewAllDomesticStocks(), CSHBViewAllForeignStocks(), viewSubMenu_, mainMenu_]
        viewSubMenu_.aryPrintable   = [errorMenu_, viewSubMenus_[0], viewSubMenus_[1], viewSubMenus_[2], viewSubMenus_[3], viewSubMenus_[4], viewSubMenus_[5], viewMenu_]
    }
    
    func Print() {
        
        mainMenu_.printMenu()
    }
}

class CSHBMainMenu: SHBPrintable {
    
    var aryPrintable : [SHBPrintable] = []
    
    func printMenu() {
        
        var inputData = 0
        
        while (inputData != aryPrintable.count) {
            
            print("\n\n\n")
            print("###################################################################")
            print("#######              Stock Management Application           #######")
            print("#######                                    by SeungHo Back  #######")
            print("#######                                                     #######")
            print("#######                                                     #######")
            print("#######                                                     #######")
            print("#######    1. Insert Stocks,   2. View Stocks,   3. exit    #######")
            print("###################################################################")
            print(" Choose menu : ")
            
            inputData = input(aryPrintable.count)
            self.aryPrintable[inputData].printMenu()
        }
    }
}

class CSHBMainMenuExit: SHBPrintable {
    
    func printMenu() {
        
        print("Thank you for using this application")
        exit(0)
    }
}

class CSHBErrorMenu: SHBPrintable {
    
    func printMenu() {
        
        print("Wrong Input Values.. Try to input again")
    }
}


