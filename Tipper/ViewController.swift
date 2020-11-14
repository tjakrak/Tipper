//
//  ViewController.swift
//  Tipper
//
//  Created by Ryan Tjakrakartadinata on 11/14/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var darkSwitch: UISwitch!
    @IBOutlet weak var darkLabel: UILabel!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func darkAction(_ sender: Any) {
        if darkSwitch.isOn == true {
            view.backgroundColor = UIColor.black
            billLabel.textColor = UIColor.white
            billField.textColor = UIColor.white
            tipLabel.textColor = UIColor.white
            tipAmountLabel.textColor = UIColor.white
            tipControl.backgroundColor = UIColor.gray
            splitLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            totalAmountLabel.textColor = UIColor.white
            upperView.backgroundColor = UIColor.darkGray
            bottomView.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
            billLabel.textColor = UIColor.black
            billField.textColor = UIColor.black
            tipLabel.textColor = UIColor.black
            tipAmountLabel.textColor = UIColor.black
            tipControl.backgroundColor = UIColor.white
            splitLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            totalAmountLabel.textColor = UIColor.black
            upperView.backgroundColor = UIColor.systemYellow
            bottomView.backgroundColor = UIColor.systemTeal
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let split = Int(splitSlider.value)
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = (bill + tip)/Double(split)
        
        // Update tip and total labels
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(format: " Split: %d", split)
        
    }
}

