//
//  ShippingCart.swift
//  ShoppingCart
//
//  Created by Duy Pham on 4/20/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import UIKit

enum ShippingType: Double {
    case standard = 0.0
    case express = 15.0
}

class ShoppingCart {
    var itemStore = ItemStore()
    var total: Double = 0.0
    var shippingType: ShippingType = .standard
    var selectedItem: [String : Int] = [:]
    var taxPercentage = 10.0
    
    func getTotal() -> Double {
        //calculate the total before tax
        var totalBeforeTax = 0.0
        for (id, quantity) in selectedItem {
            if let price = itemStore.getPrice(forItemWith: id) {
                totalBeforeTax += (price * Double(quantity))
            }
        }
        
        let calculator = Calculator(totalBeforeTax: totalBeforeTax, taxPercentage: taxPercentage, shippingCost: shippingType.rawValue)
        return calculator.getTotalAmount()
    }
    
    func add(item: Item) {
        if var quantity = selectedItem[item.id] {
            quantity += 1
            selectedItem[item.id] = quantity
        } else {
            selectedItem[item.id] = 1
        }
    }
    
    func remove(item: Item) {
        if var quantity = selectedItem[item.id] {
            quantity -= 1
            selectedItem[item.id] = quantity
        }
    }
    
    func reset() {
        total = 0
        shippingType = .standard
        selectedItem = [:]
    }
}





























