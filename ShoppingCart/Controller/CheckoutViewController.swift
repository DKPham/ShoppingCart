//
//  CheckOutViewController.swift
//  ShoppingCart
//
//  Created by Duy Pham on 4/24/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {

    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var standardShippingButton: UIButton!
    @IBOutlet weak var expressShippingButton: UIButton!
    
    var shoppingCart: ShoppingCart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Check Out"
        standardShippingButton.isEnabled = false
        update()
    }
    
    func update() {
        totalBillLabel.text = "\(shoppingCart.getTotal())"
    }
    @IBAction func standardShippingDidTap(_ sender: Any) {
        shoppingCart.shippingType = .standard
        standardShippingButton.isEnabled = false
        expressShippingButton.isEnabled = true
    }
    @IBAction func expressShippingDidTap(_ sender: Any) {
        shoppingCart.shippingType = .express
        standardShippingButton.isEnabled = true
        expressShippingButton.isEnabled = false
    }
    @IBAction func placeOrderDidTap(_ sender: Any) {
        let alertController = UIAlertController(title: "Confirm Order", message: "Please confirm that you want to make a payment of \(shoppingCart.getTotal())", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default) { (action) in
            //actionSheet style will make the alert slide up from the bottom
            let successActionMessage = UIAlertController(title: "Thank you!", message: "Your payment of \(self.shoppingCart.getTotal()) was processed successfully! Please check your email for your order receipt email and shipping information.", preferredStyle: UIAlertControllerStyle.actionSheet)
            let continueShoppingAction = UIAlertAction(title: "Let's Shop More!", style: UIAlertActionStyle.default, handler: { (action) in
                self.shoppingCart.reset()
                //go back to the root view Controller which is Cart View controller
                self.navigationController?.popToRootViewController(animated: true)
            })
            
            successActionMessage.addAction(continueShoppingAction)
            self.dismiss(animated: true, completion: nil)
            self.present(successActionMessage, animated: true, completion: nil)
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
