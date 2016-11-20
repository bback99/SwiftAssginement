//
//  CForeignStockHolding.swift
//  SeungHoBack_C0663173_Assignment
//
//  Created by shoong on 2016-06-02.
//  Copyright © 2016 SnowBack. All rights reserved.
//

import Foundation

class CSHBForeignStock: CSHBStock {

    private var fConversionRate_: NSDecimalNumber!
    
    init(fConversionRate: NSDecimalNumber, purchaseSharePrice: NSDecimalNumber, currentSharePrice: NSDecimalNumber, numberOfShares: NSDecimalNumber, companyName: String) {
        
        self.fConversionRate_ = fConversionRate
        
        super.init(fPurchaseSharePrice: purchaseSharePrice, fCurrentSharePrice: currentSharePrice, nNumberOfShares: numberOfShares, strCompanyName: companyName)
    }
    
    override func CalcCostInDollars() -> NSDecimalNumber {
        
        return super.CalcCostInDollars() * fConversionRate_
    }
    
    override func CalcValueInDollars() -> NSDecimalNumber {
        
        return super.CalcValueInDollars() * fConversionRate_
    }
    
    override var description: String {
        
        return String(format: "%@ %@ %@ %@ %@",
                      formatStock(super.getCompanyName(), fieldWidth: 20),
                      formatStock(super.getFormatForCurrency().stringFromNumber(super.getPurchaseSharePrice())!, fieldWidth: 15),
                      formatStock(super.getFormatForCurrency().stringFromNumber(super.getCurrentSharePrice())!, fieldWidth: 15),
                      formatStock(super.getFormatForNumber().stringFromNumber(super.getNumberOfShares())!, fieldWidth: 15),
                      formatStock(super.getFormatForNumber().stringFromNumber(self.fConversionRate_)!, fieldWidth: 15))
    }
}
