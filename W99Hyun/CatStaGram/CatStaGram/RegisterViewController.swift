//
//  RegisterViewController.swift
//  CatStaGram
//
//  Created by 오연서 on 9/25/23.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    //텍스트필드(번호, 성명, 이름, 비번)의 값을 "정확하게" 받아와서 가입버튼의 색상이 바뀌는 로직
    //유효성 검사를 위한 Properties
    var isValidEmail = false { //isValidEmail의 값을 입력받을 때마다 validateUserInfo() 호출
        didSet { //property observer
            self.validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    @IBOutlet weak var signupButton: UIButton!

    @IBOutlet weak var popToLoginButton: UIButton!
    //Textfields - IBOutlets으로 가져옴
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    var textFields : [UITextField] { //한번에 모든 textfield 접근하도록
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
            //bug fix - 화면 swipe
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    //MARK: - Actions
    @objc
    //textField의 값이 변경되게 되면, 이 함수가 호출됨.
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
            
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField...")
        }
    }
    
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true) //<-> pushView
    }
    
    
    @IBAction func registerButtonDidtap(_ sender: UIButton) {
        //가입 누르면 로그인화면이 나와야 하므로, 뒤로가기
        self.navigationController?.popViewController(animated: true) //<-> pushView
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        self.userInfo?(userInfo)
    }
    
    
    
    //MARK: - Helpers
    private func setupTextField(){
        
        //for문으로 textField와 action을 연결함.
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_: )), for: .editingChanged)
            
        }
    }
    //사용자가 입력한 회원정보를 확인하고 -> UI 업데이트(가입 background 색상 변경)
    private func validateUserInfo(){
            
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            
            self.signupButton.isEnabled = true
           /* UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebook
            } */
            
        }
        else {
            //-유효성 검사 false
            self.signupButton.isEnabled = false //버튼이 안눌림
            /* UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .disabledButton
            } */
        }
    }
    
    private func setupAttribute() {
        //registerButton
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        // let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1)
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }

}

//정규표현식
extension String {
    // 대소문자, 특수문자, 숫자 , 8글자 이상 -> true
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @, 2글자 -> true
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
