//
//  ViewController.swift
//  Section5-20
//
//  Created by Seyoung on 2023/10/03.
//

import UIKit

protocol Flyable{
    func fly()
}

protocol Runnable{
    func run()
}

class Person : Flyable {
    func run(){
        print("달렷따")
    }
    func fly() {
        print("날앗따")
    }
}

class ViewController: UIViewController {
    
    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        person.fly()
        person.run()
        // Do any additional setup after loading the view.
    }


}

