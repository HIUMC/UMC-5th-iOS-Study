//
//  LoginViewController.swift
//  catStaGram
//
//  Created by 반성준 on 2023/09/25.
//

import UIKit

class LoginViewController: UIViewController {
    var email = String()
    var password = String()
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        
    
    }

    
    
    @IBAction func emailTextFieldEditingChanged(_  sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
    }
    
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        
      
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        

        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    private func setupAttribute() {
        
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookcolor
        
        
    }
}
