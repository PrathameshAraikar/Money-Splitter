//
//  ViewController.swift
//  Tipsy
//
//  Created by Prathamesh Araikar on 25/09/2021.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var noOfPeople = 2
    var result = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleWoPct = String(buttonTitle.dropLast())
        let buttonTitleFinal = Double(buttonTitleWoPct)
        tip = (buttonTitleFinal)! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        noOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
      print(tip)
      print(noOfPeople)
        let bill = billTextField.text
        if bill != "" {
            let billTotal = Double(bill ?? "0.0")!
            result = billTotal * (1+tip) / Double(noOfPeople)
            finalResult = String(format: "%.2f", result)
        }
      print(finalResult)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = Int(tip * 100)
            destinationVC.result = finalResult
            destinationVC.people = noOfPeople
            
        }
    }

}
