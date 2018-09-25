//
//  Item.swift
//  ShoppingCart
//
//  Created by Duy Pham on 4/20/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import UIKit

struct Item {
    var id: String
    var title: String
    var price: Double
    var itemImage: UIImage
}

class ItemStore {
    var items: [Item] = [
        Item(id: "ipad Pro", title: "ipad Pro", price: 599, itemImage: #imageLiteral(resourceName: "img_ipad")),
        Item(id: "Apple Watch", title: "Apple Watch", price: 299, itemImage: #imageLiteral(resourceName: "img_watch")),
        Item(id: "Apple TV", title: "Apple TV", price: 199, itemImage: #imageLiteral(resourceName: "img_tv"))
    ]
    
    func getPrice(forItemWith id: String) -> Double?{
        for item in items {
            if item.id == id {
                return item.price
            }
        }
        return nil
    }
}










