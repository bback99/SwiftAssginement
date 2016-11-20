//
//  CSHBStockManagement.swift
//  SeungHoBack_C0663173_Assignment
//
//  Created by shoong on 2016-06-14.
//  Copyright © 2016 SnowBack. All rights reserved.
//

import Foundation

class CSHBStockManagement {
    
    static let singletonInstance = CSHBStockManagement()
    let MAX_STOCKS_COUNT: Int = 8
 
    // declare for printable menus
    let SHBPrintMenu_: CSHBPrintMenu
    
    // declare array that can be saved instances
    var dicStockHoldings: [String : CSHBStock] = [ : ]
        
    init() {
        SHBPrintMenu_ = CSHBPrintMenu()
    }
    
    func checkCompanyName(companyName: String) -> Bool {
        
        if let _ = dicStockHoldings[companyName] {
            return true
        }
        return false
    }
    
    func addNewStock(companyName: String, purchasePrice: Float, currentPrice: Float, shares: Int32, rate: Float) {
        
        if rate == 0 {
            dicStockHoldings[companyName] = CSHBStock(fPurchaseSharePrice: NSDecimalNumber(float: purchasePrice), fCurrentSharePrice: NSDecimalNumber(float: currentPrice), nNumberOfShares: NSDecimalNumber(int: shares), strCompanyName: companyName)
        }
        else {
            dicStockHoldings[companyName] = CSHBForeignStock(fConversionRate: NSDecimalNumber(float: rate), purchaseSharePrice: NSDecimalNumber(float: purchasePrice), currentSharePrice: NSDecimalNumber(float: currentPrice), numberOfShares: NSDecimalNumber(int: shares), companyName: companyName)
        }
    }
    
    func addAllStocks() -> Bool {
        
        var aryPurchasePrices: [Float] = [7.01, 12.09, 27.91, 18.92, 34.12, 13.01, 12.83, 15.12]
        var aryCurrentPrices: [Float] = [4.50, 10.56, 49.51, 15.01, 30.12, 9.10, 19.18, 10.56]
        var aryShares: [Int32] = [210, 102, 132, 250, 102, 90, 40, 210]
        var aryCompanies: [String] = ["Microsoft", "Apple", "Google", "Samsung", "Bell", "UbiSoft", "IBM", "AT&T"]
        var aryCoversionRates: [Float] = [0.94, 0.91, 1.13, 1.11, 0.89, 0.92, 1.01, 0.98]

        if dicStockHoldings.count >= MAX_STOCKS_COUNT {
            return false
        }
        
        let int_range = MAX_STOCKS_COUNT - dicStockHoldings.count
        for index in int_range.stride(to: 0, by: -1) {
            
            makeInstanceOfStockHoldingByRandom(UInt32(index), purchase: &aryPurchasePrices, current: &aryCurrentPrices, shares: &aryShares, companies: &aryCompanies, rates: &aryCoversionRates)
        }
        
        printAllStocks()
        return true
    }
    
    func makeInstanceOfStockHoldingByRandom(range: UInt32, inout purchase: [Float], inout current: [Float], inout shares: [Int32], inout companies: [String], inout rates: [Float]) {
        
        let nRandom = arc4random_uniform(2)
        let nRandomIndex_1 = Int(arc4random_uniform(range))
        let nRandomIndex_2 = Int(arc4random_uniform(range))
        let nRandomIndex_3 = Int(arc4random_uniform(range))
        let nRandomIndex_4 = Int(arc4random_uniform(range))
        let nRandomIndex_5 = Int(arc4random_uniform(range))
        
        let companyName = companies[nRandomIndex_1]
        if nRandom == 0
        {
            dicStockHoldings[companyName] = CSHBStock(fPurchaseSharePrice: NSDecimalNumber(float: purchase[nRandomIndex_2]), fCurrentSharePrice: NSDecimalNumber(float: current[nRandomIndex_3]), nNumberOfShares: NSDecimalNumber(int: shares[nRandomIndex_4]), strCompanyName: companyName)
        }
        else
        {
            dicStockHoldings[companyName] = CSHBForeignStock(fConversionRate: NSDecimalNumber(float: rates[nRandomIndex_5]), purchaseSharePrice: NSDecimalNumber(float: purchase[nRandomIndex_2]), currentSharePrice: NSDecimalNumber(float: current[nRandomIndex_3]), numberOfShares: NSDecimalNumber(int: shares[nRandomIndex_4]), companyName: companyName)
        }
        
        companies.removeAtIndex(nRandomIndex_1)
        purchase.removeAtIndex(nRandomIndex_2)
        current.removeAtIndex(nRandomIndex_3)
        shares.removeAtIndex(nRandomIndex_4)
        rates.removeAtIndex(nRandomIndex_5)
    }
    
    func printHeader() {
        
        print("\n")
        print(formatStock("CompanyName", fieldWidth: 20), formatStock("PurchasePrice", fieldWidth: 15),
              formatStock("CurrentPrice", fieldWidth: 15), formatStock("NumberOfShares", fieldWidth: 15), formatStock("ConversionRate", fieldWidth: 15), "\n", terminator: "")
    }
    
    func printAllStocks() {
        
        printHeader()
        
        for (_, value) in dicStockHoldings {
            
            print(value)
        }
    }
    
    func printAllStocks(isDomestic: Bool) {
        
        print("\n")
        if isDomestic == false {
            print(formatStock("CompanyName", fieldWidth: 20), formatStock("PurchasePrice", fieldWidth: 15),
                  formatStock("CurrentPrice", fieldWidth: 15), formatStock("NumberOfShares", fieldWidth: 15), formatStock("ConversionRate", fieldWidth: 15), "\n", terminator: "")
        }
        else {
            print(formatStock("CompanyName", fieldWidth: 20), formatStock("PurchasePrice", fieldWidth: 15),
                  formatStock("CurrentPrice", fieldWidth: 15), formatStock("NumberOfShares", fieldWidth: 15), "\n", terminator: "")
        }
        
        for (_, value) in dicStockHoldings {
            
            if isDomestic == false {
                if let _ = value as? CSHBForeignStock {
                    print(value)
                }
            }
            else {
                if let _ = value as? CSHBForeignStock {
                }
                else {
                    print(value)
                }
            }
        }
    }
    
    func printDisplayValues(isAsend: Bool, isAll: Bool) {
        
        printHeader()
        
        var aryForSorting: [CSHBStock] = []
        
        // sort into array by value
        for (_, value) in dicStockHoldings {
            
            aryForSorting.append(value)
        }
        
        if isAsend == true {
            aryForSorting.sortInPlace({(s1: CSHBStock, s2: CSHBStock) -> Bool in s1.CalcValueInDollars().compare(s2.CalcValueInDollars()) == NSComparisonResult.OrderedAscending})
        } else {
            aryForSorting.sortInPlace({(s1: CSHBStock, s2: CSHBStock) -> Bool in s1.CalcValueInDollars().compare(s2.CalcValueInDollars()) == NSComparisonResult.OrderedDescending})
        }
        
        for value in aryForSorting {
            
            if isAll == false {
                print(value)
                break
            } else {
                print(value)
            }
        }
    }
    
    func printDisplayProfitable(isAsend: Bool) {
        
        printHeader()
        
        var aryForSorting: [CSHBStock] = []
        
        // sort into array by value
        for (_, value) in dicStockHoldings {
            
            aryForSorting.append(value)
        }
        
        if isAsend == true {
            aryForSorting.sortInPlace({(s1: CSHBStock, s2: CSHBStock) -> Bool in (s1.CalcValueInDollars().decimalNumberBySubtracting(s1.CalcCostInDollars())).compare(s2.CalcValueInDollars().decimalNumberBySubtracting(s2.CalcCostInDollars())) == NSComparisonResult.OrderedAscending})
        } else {
            aryForSorting.sortInPlace({(s1: CSHBStock, s2: CSHBStock) -> Bool in (s1.CalcValueInDollars().decimalNumberBySubtracting(s1.CalcCostInDollars())).compare(s2.CalcValueInDollars().decimalNumberBySubtracting(s2.CalcCostInDollars())) == NSComparisonResult.OrderedDescending})
        }
        
        for value in aryForSorting {
            
            print(value)
            break
        }
    }
    
    func printDisplayCompanyName(isAsend: Bool) {
        
        printHeader()
        
        var aryForSorting: [CSHBStock] = []
        
        // sort into array by value
        for (_, value) in dicStockHoldings {
            
            aryForSorting.append(value)
        }
        
        if isAsend == true {
            aryForSorting.sortInPlace({(s1: CSHBStock, s2: CSHBStock) -> Bool in (s1.getCompanyName() < s2.getCompanyName())})
        } else {
            aryForSorting.sortInPlace({(s1: CSHBStock, s2: CSHBStock) -> Bool in (s1.getCompanyName() > s2.getCompanyName())})
        }
        
        for value in aryForSorting {
            
            print(value)
        }
    }

}
