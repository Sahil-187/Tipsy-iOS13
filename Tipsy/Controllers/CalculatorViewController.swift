//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipSelected : Float = 0.1
    var numberOfPeoples : Int = 2
    var totalBillAmount : Float = 0
    var calculatedAmount : String = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let str = sender.currentTitle!
        zeroPctButton.isSelected = false;
        tenPctButton.isSelected = false;
        twentyPctButton.isSelected = false;
        if(str=="0%") {
            zeroPctButton.isSelected = true;
            tipSelected = 0.0
        } else if(str=="10%") {
            tenPctButton.isSelected = true;
            tipSelected = 0.1
        } else {
            twentyPctButton.isSelected = true;
            tipSelected = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let numPeople = String(format: "%.0f", sender.value)
        splitNumberLabel.text = numPeople
        numberOfPeoples = Int(numPeople)!
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let a = billTextField.text
        totalBillAmount = Float(a!) ?? 0
        let tipAmount = totalBillAmount * tipSelected
        let totalAmount = totalBillAmount + tipAmount
        let totalAmountPerPerson = totalAmount/Float(numberOfPeoples)
        calculatedAmount = String(format: "%.2f", totalAmountPerPerson)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier=="goToResult") {
            print(calculatedAmount)
            print(numberOfPeoples)
            print(tipSelected)
            let VCdestination = segue.destination as! ResultsViewController
            VCdestination.totalAmount = calculatedAmount
            VCdestination.numberOfPeoples = String(numberOfPeoples)
            VCdestination.tipSelected = String(format: "%.0f", tipSelected*100)
        }
    }
}

