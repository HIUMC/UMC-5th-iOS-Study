//
//  SecondViewController.swift
//  Protocol
//
//  Created by 강희진 on 2023/10/02.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelgate {
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
    

    @IBOutlet weak var textField: UITextField!
    var previousViewController : ViewController?
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        //화면을 없애줌
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previousViewController?.delegate=self
    }
}
