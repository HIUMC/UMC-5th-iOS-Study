//
//  LoginVIewController.swift
//  CatStaGram
//
//  Created by 오연서 on 9/25/23.
//

import UIKit

class LoginVIewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupAttribute()
    }
    
    

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        //optional _ 값이 있을수도 없을수도
        //이메일 텍스트값이 아무것도 입력하지 않을 때 어떤 처리도 하지 않음
        //이메일 텍스트값이 있으면 유효성검사.
        let text = sender.text ?? "" //기본값을 줌. 없으면 ?? 뒤에값을 넣는다. -> opitional 해지
         
        self.loginButton.backgroundColor 
        = text.isValidEmail() ? .facebook : .disabledButton //버튼색깔 바뀌기
        
        self.email = text
        print(text)
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor
        = text.count > 2 ? .facebook : .disabledButton
        self.password = text
        print(text)
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        //회원가입 정보를 전달받아서 textField와 일치하면 로그인 돼야함.
        guard let userInfo = self.userInfo else {return}
        if userInfo.email == self.email
            && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as!
            UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else {
        }
    }
    
 
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면전환
        // 1스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2 뷰컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3 화면전환 메소드를 이용해서 화면 전환
//        self.present(registerViewController, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        //ARC - swift의 메모리 처리 방법 (default = strong self)
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    
    
    private func setupAttribute() {
        //registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "회원가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }

}
