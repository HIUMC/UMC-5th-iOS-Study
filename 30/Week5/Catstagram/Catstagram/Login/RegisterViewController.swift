//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by Seyoung on 10/30/23.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    //유효성 검사를 위한 프로퍼티
    var isValidEmail = false{
        didSet {//isValidEamil이 호출될때마다 ValidateUserInfo도 함께 호출 = 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidName = false{
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
    //Textfields
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    //연산 프로퍼티
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    
    //MARK: - LIfecyce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        //bugfix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    
    //MARK: - Actions
    @objc
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
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    
    //MARK: - Helpers
    private func setupTextField(){
        
        textFields.forEach{ tf in tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)}
        
    }
    
    //사용자가 입력한 정보를 확인하고 -> UI updae
    private func validateUserInfo(){
        
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebook
            }
            
            
        } else{
            //유효하지않음
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .disabledButton
            }
            
        }
    }
    private func setupAttribute(){
        //registerButton
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(self.popToLoginButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }}
        
        //정규표현식
        extension String{
            //비밀번호 : 대소문자, 특수문자, 숫자 8자 이상일 때 -> True
            func isValidPassword() -> Bool {
                let regularExpression = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}"
                let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
                
                return passwordValidation.evaluate(with: self)
            }
            
            //@ 2글자
            func isValidEmail() -> Bool {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
                return emailTest.evaluate(with: self)
            }
        }
    

