//
//  LoginViewController.swift
//  Catstagram
//
//  Created by Seyoung on 10/30/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupAttribute(){
        //registerButton
            
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
            
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
            
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
            
        let attributes = generateButtonAttribute(self.registerButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
            
        self.registerButton.setAttributedTitle(attributes, for: .normal)
        }
    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        //옵셔널 : 값이 있을수도 있고 없을수도 있다.
        let text = sender.text ?? ""
        
        self.LoginButton.backgroundColor
        = text.isValidEmail() ? .facebook : .disabledButton
        
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.LoginButton.backgroundColor
        = text.count > 2 ? .facebook : .disabledButton
        
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        //회원가입 정보 전달받아서, 그것과 텍스트필드 데이터가 일치하면 로그인
        // guard : 데이터 있다면 변수 선언
        guard let userInfo = self.userInfo else { return }
        if userInfo.email == self.email
            && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true,completion:nil)
        }}
            
            
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면전환
        //1스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main",bundle: nil)
        //2뷰컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        //3 화면 전환 메소드를 이용해서 화면을 전환
        //        self.present(registerViewController, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        // ARC -> 강한참조 / 약한참조 -> ARC 낮춤
        registerViewController.userInfo = { [weak self](userInfo) in self?.userInfo = userInfo
        }
    
    }
}
