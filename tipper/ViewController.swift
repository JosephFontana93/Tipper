//
//  ViewController.swift
//  tipper
//
//  Created by Joseph Fontana on 8/4/20.
//  Copyright © 2020 Joseph Fontana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(defaults.integer(forKey: "userTipControl"))
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "userTipControl")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }
    

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.10, 0.15, 0.20]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        tipPercentageLabel.text = String(format:"$%.2f", tip)
        
        totalLabel.text = String(format:"$%.2f", total)
        
        
    }
    
}

