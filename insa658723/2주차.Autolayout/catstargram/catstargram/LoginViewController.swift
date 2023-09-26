//
//  LoginViewController.swift
//  catstargram
//
//  Created by 이지우 on 2023/09/24.
//

import UIKit

class LoginViewController: UIViewController {
    var email = String()
    var password = String()
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func emailTextFieldEditingChanged(_  sender: UITextField) {
        // 옵셔널
        // 값이 있을수도 없을수도
        let text = sender.text ?? ""  // 옵셔널과 기본값
        self.email = text
    }
    
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""  // 옵셔널과 기본값
        self.password = text
    }
    
    @IBAction func LoginButtonDidTap(_ sender: UIButton) {
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 화면전환
        // 1.스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2.뷰컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
//        // 3.화면전환 메서드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil) // animated는 애니메이션 유무, completion은 화면동작 이후에 필요한 동작이 있을때
        self.navigationController?.pushViewController(registerViewController, animated: true) // 계정생성을 누르면 화면이 옆으로 전환
    }
    
    
    
    private func setupAttribute() {
        // registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
