//
//  LoginViewController.swift
//  section4login
//
//  Created by 강삼고 on 2023/10/02.
//

import UIKit

class LoginViewController: UIViewController {

    var email=String()
    var password=String()
    var userInfo: UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        
    }
    

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        //옵셔널
        // 값이 있을 수도 있고 없을 수도 <- 이 두 상태를 하나의 상태로 정의하는 개념이 옵셔널
        let text=sender.text ?? ""//입력값 받아오기
        // 기본값을 넣어서 옵셔널을 해제한 경우(값이 없을 경우 ?? 뒤에 있는 값을 넣겠다는 의미)
        
        //삼항 연산자 condition ? valueIfTrue : valueIfFalse

        self.loginButton.backgroundColor = text.isValidEmail() ? UIColor(named: "facebookColor") : UIColor(named: "disabledButtonColor")

        
        self.email=text
        
    }

    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        
        let text=sender.text ?? ""
        self.loginButton.backgroundColor = text.count > 2 ? UIColor(named: "facebookColor") : UIColor(named: "disabledButtonColor")

        self.password=text
    }
    
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        //회원가입 정보를 전달받아서, 그것과 textField 데이터가 일치하면,
        //로그인이 되어야 한다.
        guard let userInfo = self.userInfo else { return }
        
        if userInfo.email == self.email
            && userInfo.password == self.password{
//            self.loginButton.backgroundColor=UIColor(named: "facebookColor")
//            self.loginButton.isEnabled = true
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "TapBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        }else{
//            self.loginButton.backgroundColor=UIColor(named: "disabledButtonColor")
//            self.loginButton.isEnabled=false
            
        }
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면전환
        //1. 스토리보드를 생성(메인 스토리보드의 경우 생성하지 않아도 자동으로 연결해주지만, 스토리보드가 여러개가 되면 직접 생성해줘야 한다)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //2. 뷰컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        //3. 화면 전환 메소드를 이용해 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil) //completion은 화면 전환 이후에 해야하는 동작이 있는 경우 코드 작성, 없으면 nil
        self.navigationController?.pushViewController(registerViewController, animated: true)
        //위아래 전환이 아닌 가로전환 구현을 위해 작성된 코드 (push)
        
        registerViewController.userInfo = {
            //weak self 다음에 알아보기 ARC개념 ARC-> 강한 참조/ 약한참조 -> ARC 낮춰줌 -> 메모리 낭비 막아주는..
            [weak self](userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    
    private func setupAttribute(){
        //registerButton
        //정한 순서대로 적용해줘야함
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1=UIFont.systemFont(ofSize: 10)
        let font2=UIFont.boldSystemFont(ofSize: 10)
        
        let color1=UIColor.darkGray
        let color2=UIColor(named: "facebookColor") ?? .darkGray
        
        let attributes = generateButtonAttribute(self.registerButton, texts: text1, text2
                                                 , fonts: font1, font2
                                                 , colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
        
    }
}
