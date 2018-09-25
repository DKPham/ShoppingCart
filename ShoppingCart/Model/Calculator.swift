//
//  Calculator.swift
//  ShoppingCart
//
//  Created by Duy Pham on 4/20/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import Foundation

class Calculator {
    var totalBeforeTax: Double
    var total: Double
    private var taxPercentage: Double
    var shippingCost: Double
    
    init(totalBeforeTax: Double, taxPercentage: Double, shippingCost: Double) {
        self.totalBeforeTax = totalBeforeTax
        self.taxPercentage = taxPercentage
        self.shippingCost = shippingCost
        self.total = 0.0
    }
    
    func getTotalAmount() -> Double {
        let tax = total * taxPercentage / 100.0
        total = totalBeforeTax + tax + shippingCost
        return total
    }
}














