//
//  RegisterViewController.swift
//  catstargram
//
//  Created by 이지우 on 2023/09/24.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    // 구조체를 파라미터로 전달
    // 클로저.
    var userInfo: ((UserInfo) -> Void)?
    
    // 유효성검사를 위한 프로퍼티 -> 유효성검사를 하고 난 Bool값을 여기에 저장한다.
    var isValidEmail = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo() // isValidEmail에서 값을 입력 받을때마다 이 메서드가 호출된다.
        }
    }
    
    var isValidName = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet { // 프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField] // 이 프로퍼티로 반복연산을 더 간단하게 연산가능.
    }
    
    // MARK: = LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        // bug fix
        // 제스처로도 뒤로가기가 가능.
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    
    // MARK: -Action
    @objc // 코드로 작성할때는 이 표시를 반드시 해야함.
    func textFieldEditingChanged(_ sender: UITextField) {
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
        // 뒤로가기
        // 이전화면으로 돌아가는것을 popviewcontroller라고 한다.
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            password: self.password)
        
        self.userInfo?(userInfo)
        
    }
    
    
    // MARK: - Helpers
    private func setupTextField() {
        // 텍스트필드와 액션을 연결함.
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
            // emailTextField에서 이벤트가 오면 타켓은 누가 처리할지 정함.
        }
    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> UI업데이트(유효한정보가 아니면 색이 흐릿함)
    private func validateUserInfo() {
        
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) { // UIKit에서 애니메이션 설정 -> 터치하면 천천히 변화
                self.signupButton.backgroundColor = UIColor.facebookColor
            }
            
        } else {
            // 유효성검사 -> 유효하지않음
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .disabledButtonColor
            }
        }
    }
    
    private func setupAttribute() {
        // registerButton
        
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
            colors: color2, color1)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }
}

    // 정규표현식 -> 이것을 통해 유효성 검사를 하고 True, False를 판별한다.
    extension String { // extention: 기능확장
        // 대문자, 소문자, 특수문자, 숫자, 숫자 8자 이상일 때 -> True
        func isValidPassword() -> Bool {
            let regularExpression = "(?=.*[A-Z])(?=.*[a-z])(?=.*[\\d])(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
            let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
            
            return passwordValidation.evaluate(with: self)
        }
        
        //@ 2글자
        func isValidEmail() -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
    }
}

