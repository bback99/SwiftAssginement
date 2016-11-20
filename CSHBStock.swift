//
//  CStockHolding.swift
//  SeungHoBack_C0663173_Assignment
//
//  Created by shoong on 6/1/16.
//  Copyright © 2016 SnowBack. All rights reserved.
//

import Foundation

class CSHBStock: CustomStringConvertible {
    
    private var fPurchaseSharePrice_: NSDecimalNumber!
    private var fCurrentSharePrice_: NSDecimalNumber!
    private var nNumberOfShares_: NSDecimalNumber!
    private var strCompanyName_: String
    
    private var formatterForCurrency_ = NSNumberFormatter()
    private var formatterForNumber_ = NSNumberFormatter()

    
    init(fPurchaseSharePrice: NSDecimalNumber, fCurrentSharePrice: NSDecimalNumber, nNumberOfShares: NSDecimalNumber, strCompanyName: String) {
        
        formatterForCurrency_.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatterForNumber_.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.fPurchaseSharePrice_ = fPurchaseSharePrice
        self.fCurrentSharePrice_ = fCurrentSharePrice
        self.nNumberOfShares_ = nNumberOfShares
        self.strCompanyName_ = strCompanyName
    }
    
    func CalcCostInDollars() -> NSDecimalNumber {
    
        return fPurchaseSharePrice_ * nNumberOfShares_
    }
    
    func CalcValueInDollars() -> NSDecimalNumber {
        
        return fCurrentSharePrice_ * nNumberOfShares_
    }
    
    func getPurchaseSharePrice() -> NSDecimalNumber {
        return fPurchaseSharePrice_
    }
    
    func getCurrentSharePrice() -> NSDecimalNumber {
        return fCurrentSharePrice_
    }
    
    func getNumberOfShares() -> NSDecimalNumber {
        return nNumberOfShares_
    }
    
    func getCompanyName() -> String {
        return strCompanyName_
    }
    
    func getFormatForCurrency() -> NSNumberFormatter {
        return formatterForCurrency_
    }
    
    func getFormatForNumber() -> NSNumberFormatter {
        return formatterForNumber_
    }
    
    var description: String {
        
        return String(format: "%@ %@ %@ %@",
                        formatStock(self.strCompanyName_, fieldWidth: 20),
                        formatStock(formatterForCurrency_.stringFromNumber(self.fPurchaseSharePrice_)!, fieldWidth: 15),
                        formatStock(formatterForCurrency_.stringFromNumber(self.fCurrentSharePrice_)!, fieldWidth: 15),
                        formatStock(formatterForNumber_.stringFromNumber(self.nNumberOfShares_)!, fieldWidth: 15))
    }
}
