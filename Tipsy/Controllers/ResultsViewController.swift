//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Sahil  on 01/04/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    var totalAmount : String?
    var numberOfPeoples : String?
    var tipSelected : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalAmount ?? "0.00"
        settingLabel.text? = "Split between \(numberOfPeoples ?? "2") peoples, with \(tipSelected ?? "0")% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
