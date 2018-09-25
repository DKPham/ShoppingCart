//
//  ViewController.swift
//  ShoppingCart
//
//  Created by Duy Pham on 4/8/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var item1ImageView: UIImageView!
    @IBOutlet weak var item1TitleLabel: UILabel!
    @IBOutlet weak var item1PriceLabel: UILabel!
    @IBOutlet weak var item1QuantityLabel: UILabel!
    @IBOutlet weak var item1Stepper: UIStepper!
    var item1Quantity = 0
    
    @IBOutlet weak var item2ImageView: UIImageView!
    @IBOutlet weak var item2TitleLabel: UILabel!
    @IBOutlet weak var item2PriceLabel: UILabel!
    @IBOutlet weak var item2QuantityLabel: UILabel!
    @IBOutlet weak var item2Stepper: UIStepper!
    var item2Quantity = 0
    
    @IBOutlet weak var item3ImageView: UIImageView!
    @IBOutlet weak var item3TitleLabel: UILabel!
    @IBOutlet weak var item3PriceLabel: UILabel!
    @IBOutlet weak var item3QuantityLabel: UILabel!
    @IBOutlet weak var item3Stepper: UIStepper!
    var item3Quantity = 0

    @IBOutlet weak var totalBillLabel: UILabel!
    
    var shoppingCart: ShoppingCart!
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.shoppingCart = ShoppingCart()
        self.itemStore = shoppingCart.itemStore
        self.updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if shoppingCart.getTotal() == 0 {
            self.reset()
        }
        self.updateUI()
    }
    
    func updateUI() {
        if itemStore.items.count >= 3 {
            let item1 = itemStore.items[0]
            item1ImageView.image = item1.itemImage
            item1TitleLabel.text = item1.title
            item1PriceLabel.text = "\(item1.price)"
            item1QuantityLabel.text = "\(item1Quantity)"
            item1ImageView.layer.cornerRadius = 5.0
            item1ImageView.layer.masksToBounds = true
            
            let item2 = itemStore.items[1]
            item2ImageView.image = item2.itemImage
            item2TitleLabel.text = item2.title
            item2PriceLabel.text = "\(item2.price)"
            item2QuantityLabel.text = "\(item2Quantity)"
            item2ImageView.layer.cornerRadius = 5.0
            item2ImageView.layer.masksToBounds = true
            
            let item3 = itemStore.items[2]
            item3ImageView.image = item3.itemImage
            item3TitleLabel.text = item3.title
            item3PriceLabel.text = "\(item3.price)"
            item3QuantityLabel.text = "\(item3Quantity)"
            item3ImageView.layer.cornerRadius = 5.0
            item3ImageView.layer.masksToBounds = true
            
            let totalAmount = shoppingCart.getTotal()
            totalBillLabel.text = "\(totalAmount)"
        }
    }
    
    func reset() {
        item1Quantity = 0
        item2Quantity = 0
        item3Quantity = 0
        item1Stepper.value = 0
        item2Stepper.value = 0
        item3Stepper.value = 0
    }
    @IBAction func item1StepperDidTap(_ sender: UIStepper) {
        let newQuantity = Int(sender.value)
        if newQuantity > item1Quantity {
            shoppingCart.add(item: itemStore.items[0])
        } else {
            shoppingCart.remove(item: itemStore.items[0])
        }
        item1Quantity = newQuantity
        updateUI()
    }
    
    @IBAction func item2StepperDidTap(_ sender: UIStepper) {
        let newQuantity = Int(sender.value)
        if newQuantity > item2Quantity {
            shoppingCart.add(item: itemStore.items[1])
        } else {
            shoppingCart.remove(item: itemStore.items[1])
        }
        item2Quantity = newQuantity
        updateUI()
    }
    @IBAction func item3StepperDidTap(_ sender: UIStepper) {
        let newQuantity = Int(sender.value)
        if newQuantity > item3Quantity {
            shoppingCart.add(item: itemStore.items[2])
        } else {
            shoppingCart.remove(item: itemStore.items[2])
        }
        item3Quantity = newQuantity
        updateUI()
    }
    struct Storyboard {
        static let showCheckout = "ShowCheckout"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showCheckout {
            if let checkOutViewController = segue.destination as? CheckOutViewController {
                checkOutViewController.shoppingCart = self.shoppingCart
            }
        }
    }
}

