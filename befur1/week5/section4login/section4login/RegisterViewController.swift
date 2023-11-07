//
//  RegisterViewController.swift
//  section4login
//
//  Created by 강삼고 on 2023/10/02.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: -Properties
    var email: String = ""
    var name: String = ""
    var nickName: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    //유효성 검사를 위한 프로퍼티
    var isValidEmail = false{
        didSet{//프로퍼티 옵저버
            self.validateUserInfo()//이 프로퍼티에서 값을 입력받을 때마다 이 method가 호출
            
        }
    }
    
    var isValidName = false{
        didSet{
            self.validateUserInfo()
            
        }
    }
    
    var isValidNickname = false{
        didSet{
            self.validateUserInfo()
            
        }
    }
    
    var isValidPassword = false{
        didSet{
            self.validateUserInfo()
            
        }
    }
    //textFields
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    //반복되는 코드 처리를 위한 연산 property
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nickNameTextField, passwordTextField]
    }
    //ui변환에 사용할 가입버튼
    
    @IBOutlet weak var signupButton: UIButton!
    
    //계정이 있으신가요? 로그인 버튼
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
    //MARK: - Lifecyce
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        
        //signupButton.cornerRadius=100 코드로 직접 모따기
        setupAttribute()
        
        //bug fix .. 스와이프로 뒤로가기?
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        
    }
    
    //MARK: - Actions
    @objc //코드로 작성할때는 objc로
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail=text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName=text.count>=2
            self.name = text
            
        case nickNameTextField:
            self.isValidNickname=text.count>=2
            self.nickName = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        
        default:
            fatalError("Missing TextField..")
        }
        
        
    }
    
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        //뒤로가기
        //popview 뒤로가기 <-> pushview
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        let userInfo=UserInfo(email: self.email,
                              name: self.name,
                              nickName: self.nickName,
                              password: self.password)
        
        self.userInfo?(userInfo)
        
    }
    
    
    
    
    
    //MARK: - Helpers
    
    private func setupTextField() {
        //textfield와 action을 연결하는 단계
        
        textFields.forEach{ //forEach는 for문으로 생각
            tf in
            tf.addTarget(self,
                         action: #selector(textFieldEditingChanged(_:)),
                        for: .editingChanged)
        }
        
        //addTarget -> emailTextField에서 이벤트가 오게 되면 그 target은 누가 처리할거냐, 어떤 액션을 처리할 것이냐, 어떤 액션에 대해서 처리할 것인가?
    }
    // 사용자가 입력한 회원 정보를 확인하고 -> UI 업데이트(가입 버튼 색상 변환)
    private func validateUserInfo() {
        if isValidEmail && isValidName
            && isValidName && isValidPassword
        {
            self.signupButton.isEnabled=true
            UIView.animate(withDuration: 0.33) { //애니메이션 추가
                self.signupButton.backgroundColor=UIColor(named: "facebookColor")
            }
            
        }else
        {   //유효성 검사 -> 유효하지 않음
            self.signupButton.isEnabled=false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor=UIColor(named: "disabledButtonColor")
            }
            
            
        }
    }
    
    private func setupAttribute(){
        //registerButton
        //정한 순서대로 적용해줘야함
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1=UIFont.systemFont(ofSize: 10)
        let font2=UIFont.boldSystemFont(ofSize: 10)
        
        let color1=UIColor.darkGray
        let color2=UIColor(named: "facebookColor") ?? .darkGray
        
        let attributes = generateButtonAttribute(self.popToLoginButton, texts: text1, text2
                                                 , fonts: font1, font2
                                                 , colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
        
    }
}

//유효성 검사
// 정규표현식
extension String{//string 타입의 기능확장을 통해서 method 2개 추가
    //대문자, 소문자, 특수문자, 숫자, 8자 이상일때 -> True
    func isValidPassword() -> Bool {
        let regularExpression = #"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,20}$"#
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
        
    }
    
    func isValidEmail() -> Bool {
        let emailRegEX = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEX)
        return emailTest.evaluate(with: self)
    }
}
