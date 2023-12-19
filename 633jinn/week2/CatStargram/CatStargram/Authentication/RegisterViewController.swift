//
//  RegisterViewController.swift
//  CatStargram
//
//  Created by 강희진 on 2023/09/27.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: -  Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    // UserInfo 데이터를 input하면 return할 필요 없는 함수가 만들어진다.
    var userInfo: ((UserInfo) -> Void)?

    
    // 유효성 검사를 위한 프로퍼티 설정
    var isValidEmail = false{
        didSet{
            // 값을 입력 받을 때마다 아래의 메소드 실행됨
            //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidName = false{
        didSet{
            //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false{
        didSet{
            //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isvalidPassword = false{
        didSet{
            //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    @IBOutlet weak var signupButton: UIButton!
    
    // Textfields
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    
    // MARK: - LIfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        //bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        }
    
    // MARK: - Actions
    
    @objc // TextField와 Action 연결
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        // 어떤 sender로부터 전달받았는지에 따라 다른 기능 수행
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
            self.isvalidPassword = text.isValidPassword()
            self.password = text
        default:
            fatalError("Missing TextField...")
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        // popViewController: 뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func registerButtonDidtap(_ sender: UIButton) {
            // popViewController: 뒤로가기
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
        
    }
    
    
    // MARK: - Helpers
    private func setupTextField(){
        
        textFields.forEach{tf in
            tf.addTarget(self,
                         action:#selector(textFieldEditingChanged(_: )),
                         for:.editingChanged)
        }
    }
    
    //사용자가 입력한 회원정보를 확인 -> UI 업데이트
    private func validateUserInfo() {
        
        // 아래의 네 항목이 유효성 검사를 통과한다면
        if isValidEmail && isValidName && isValidNickname && isvalidPassword {
            self.signupButton.backgroundColor = UIColor.facebookColor
        }else{
            self.signupButton.backgroundColor = UIColor.disabledButtonColor
        }
    }
    private func setupAttribute() {
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        // for: .normal = 정상적인 상태에서 attributes가 적용된다.
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }
    
}
    // 정규표현식
extension String {
    // 대소문자, 특수문자, 숫자 8자 이상일 때 -> True
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @ 포함여부, 2글자 이상
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
