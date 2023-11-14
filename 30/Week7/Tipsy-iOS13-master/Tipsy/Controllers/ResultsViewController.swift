//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Seyoung on 11/14/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."

        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
