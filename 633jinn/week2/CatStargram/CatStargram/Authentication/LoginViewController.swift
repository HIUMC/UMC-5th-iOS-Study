//
//  LoginViewController.swift
//  CatStargram
//
//  Created by 강희진 on 2023/09/27.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    // 클래스 내의 멤버변수에 저장해서 다른 메소드에서도 사용할 수 있다.
    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // ?? 다음의 ""는 기본값을 준 것이다.
        // optional에 기본값을 줘서 값이 없을 경우 ?? 뒤의 값을 넣겠다.
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor
        = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        
        self.email = text
        
    }
    @IBAction func passwordTextFeildEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor = text.count > 2 ?.facebookColor : .disabledButtonColor
        
        self.password = text
    }
    
    @IBAction func loginButtonDidtap(_ sender: UIButton) {
//        회원가입정보를 전달받아, textField 데이터와 일치하면,
//        로그인이 되어야한다
//        guard를 이용해 userInfo가 있게 되면 let에 새롭게 데이터를 만들고, 
//        그렇지 않을 경우 else를 통해 함수 실행이 종료된다.
        guard let userInfo = self.userInfo else {return}
        
        if userInfo.email == self.email
            && userInfo.password == self.password{
            
            //화면 전환
            let vc = storyboard? .instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            
            self.view.window?.windowScene?.keyWindow?.rootViewController = vc
            
        } else{
            self.loginButton.backgroundColor = .disabledButtonColor
            self.loginButton.isEnabled = false
        }
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 화면전환
        // 1. 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2. 뷰 컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용해 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        /*
         animated: 애니메이션 유무
         completion: 화면전환 후에 동작이 있는지, 없다면 nil
        */
        
        // 화면 전환 후 입력받은 userInfo 가져오기
        registerViewController.userInfo = {[weak self](userInfo) in
            self?.userInfo = userInfo
        }
        
    }
    
    
    private func setupAttribute() {
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
        
        // for: .normal = 정상적인 상태에서 attributes가 적용된다.
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
