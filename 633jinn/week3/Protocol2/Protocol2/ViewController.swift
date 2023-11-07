//
//  ViewController.swift
//  Protocol2
//
//  Created by 강희진 on 2023/10/02.
//

import UIKit

protocol Flyalbe {
    func fly()
}

protocol Runnalbe {
    func run()
}

class Person :Flyalbe, Runnalbe {
    func run() {
        print("달렸다")
    }
    
    func fly() {
        print("날았다")
    }
    
    
}

class ViewController: UIViewController {

    let person = Person()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        person.fly()
        person.run()
    }
}

