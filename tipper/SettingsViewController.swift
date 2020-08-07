//
//  SettingsViewController.swift
//  tipper
//
//  Created by Joseph Fontana on 8/5/20.
//  Copyright © 2020 Joseph Fontana. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentage: UISegmentedControl!
    
    @IBOutlet weak var userCurrency: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipPercentage.selectedSegmentIndex = defaults.integer(forKey: "userTipControl")
        
        userCurrency.text! = defaults.string(forKey: "userCurrency") ??  "$"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func setDefaultTip(_ sender: Any) {
                
        let defaultTip =  defaultTipPercentage.selectedSegmentIndex
        //print(defaultTip)
        defaults.set(defaultTip, forKey: "userTipControl")
        print(defaults.integer(forKey: "userTipControl"))
        defaults.synchronize()
    }
    
    @IBAction func setDefaultCurrency(_ sender: Any) {
      
        let defaultCur:String = userCurrency.text!
        
        defaults.set(defaultCur, forKey: "userCurrency")
        
        print(defaults.string(forKey: "userCurrency") ??  "$")
        
        defaults.synchronize()
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
