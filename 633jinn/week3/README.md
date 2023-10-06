# iOS & Swift - The Complete iOS App
# 섹션 4 - 로그인, 회원가입 화면 구성 및 기능 구현
# 8,9. 로그인 화면 구성, 로그인 화면 - UI 추가

## 1) Color Set

1. Asset의 Color Set
    - interface builder에서 색상을 편리하게 접근할 수 있다.
    - 특정 색상이 반복적으로 사용될 때 이용하기 좋음
2. Color+Extension
    - 아래와 같이 코드를 이용해서도 컬러를 저장해둘 수 있다.
    - 코드
        
        ```swift
        //
        //  Color+Extension.swift
        //  CatStargram
        //
        //  Created by 강희진 on 2023/09/27.
        //
        
        import UIKit
        
        extension UIColor{
            static let facebookColor = UIColor(
                red: 0.255,
                green: 0.576,
                blue: 0.947,
                alpha: 1.0)
            static let disabledButtonColor = UIColor(
                red: 0.766,
                green: 0.872,
                blue: 0.980,
                alpha: 1.0)
        }
        ```
        

## 2) Storyboard와 viewController 연결하기

`Cocoa Touch Class`를 만들어 storyboard와 연결해야지만 사용자의 **상호작용에 반응**할 수 있다. 

이때 연결하기 위해서는 원하는 storyboard 상단의 세 아이콘 중 맨 왼쪽을 누르고, inspector에 들어가야 한다.

<aside>
💡 ViewController 아이콘을 누르고, inspector에서 “Is initial View Controller”를 눌러야 
**가장 처음으로 화면에 나타나게 된다**

</aside>

## 3) Action 연결하기 - mainboard 이용

1. option + LoginViewController 클릭
2. 원하는 field 선택 + control + 코드에 드래그 
→ Connection: Action, Type: UITextField, Event: Editing Changed, Arguments: Sender
    
    <aside>
    💡 Event : Type의 액션의 방식을 결정한다.
    ex) Editing Changed : 글자 입력, Touch Up Inside : 버튼을 눌렀다 떼는 동작
    Type: Action이 일어나는 곳, UITextField, Button 등이 해당된다.
    
    </aside>
    

## 4) Optional에 기본값 주기

액션을 연결할 때 왼쪽과 같이 코드를 작성하면 에러를 띄게 된다.

이는 Optional과 관련된 부분으로, ?? 다음의 값을 통해 기본값을 주어 에러를 해결할 수 있다.
`let text = sender.text ?? ""`

```swift
//before
@IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
    let text = sender.text 
    self.email = text
    
}
```

```swift
//after
@IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
    // ?? 다음의 ""는 기본값을 준 것이다.
    // optional에 기본값을 줘서 값이 없을 경우 ?? 뒤의 값을 넣겠다.
    let text = sender.text ?? ""
    self.email = text
}
```

위에서 사용자로부터 전달받은 코드를 클래스 내에 저장하여 사용할 수도 있다.

```swift
class LoginViewController: UIViewController {
    
    // 클래스 내의 멤버변수에 저장해서 다른 메소드에서도 사용할 수 있다.
    var email = String()
    var password = String()
```

## 5.  화면전환 메소드

### 화면 전환 순서

1. 스토리보드 생성

```swift
**let** storyboard = UIStoryboard(name: "Main", bundle: **nil**)
```

2. 뷰 컨트롤러를 생성

```swift
let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
```

1. storyboard에서 ViewController 추가
2. 기능에 따른 Cocoa Touch Class 생성
3. 둘을 연결한다.

<aside>
💡 Storyboard ID는 Controller내에 ViewController를 구분하기 위해 사용한다.

</aside>

3. 화면전환 메소드를 이용해 화면을 전환

# 10. 로그인 화면 - 화면전환

## 화면 전환 가로로, 세로로

storyboard의 `embed in`에 들어가 Navigation Controller를 만들 수 있다.

Navigation Controller: 어떤화면을 보여주고 이동할지 도와주는 컨테이너.

- 점점 상세 내용으로 들어가는 **수직적인 구조**에서 주로 사용된다.

```swift
// 아래에서부터 세로로 창이 올라온다.
self.present(registerViewController, animated: true, completion: nil)
// 오른쪽에서 가로로 창이 나온다.
self.navigationController?.pushViewController(registerViewController, animated: true)
```

# 12. 회원가입 - 액션 연결

## Action 연결하기 - 코드 사용

@IBAction 대신 `@objc`를 사용한다.

### 1) textfield 가져오기

UITextField ctrl + 드래그, 드롭 후 outlet형태로 변수를 가져온다.

```swift
@IBOutlet weak var emailTextField: UITextField!
    
@IBOutlet weak var nameTextField: UITextField!

@IBOutlet weak var nicknameTextField: UITextField!

@IBOutlet weak var passwordTextField: UITextField!
```

### 2) textfield를 action과 연결하기

emailTextField.addTarget(self, action: #selector(textFieldEditingChanged(_: )), for:.editingChanged)

self: 이 메소드를 다룰 곳, 지금은 RegisterViewController이기 때문에 self로 해줬다.

action: 값이 들어갈 때, 어떤 action을 취할 것인지

for: 어떤 변화가 일어날 때 감지할것인가(지금은 값 변경) 

```swift
var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    } // 리스트 형태

// MARK: - LIfecycle
override func viewDidLoad() {
    super.viewDidLoad()
    setupTextField()
}

// MARK: - Actions

@objc
func textFieldEditingChanged(_ sender: UITextField){
    
}
// MARK: - Helpers
private func setupTextField(){
        textFields.forEach{tf in
                    tf.addTarget(self,
                                 action:#selector(textFieldEditingChanged(_: )),
                                 for:.editingChanged)
                }
        /* 아래의 코드를 위와 같이 줄일 수 있다.
    emailTextField.addTarget(self, action: #selector(textFieldEditingChanged(_: )), for:.editingChanged)
    nameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_: )), for:.editingChanged)
    nicknameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_: )), for:.editingChanged)
    passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged(_: )), for:.editingChanged)
        */
}
```

### 3) 액션 추가하기

- 코드
    
    ```swift
    @objc // TextField와 Action 연결
        func textFieldEditingChanged(_ sender: UITextField){
            let text = sender.text ?? ""
            
            // 어떤 sender로부터 전달받았는지에 따라 다른 기능 수행
            switch sender {
            case emailTextField:
                print("email")
            case nameTextField:
                print("name")
            case nicknameTextField:
                print("nickname")
            case passwordTextField:
                print("password")
            default:
                fatalError("Missing TextField...")
            }
        }
    ```
    

### 4) 최종 코드

- 코드
    
    ```swift
    //
    //  RegisterViewController.swift
    //  CatStargram
    //
    //  Created by 강희진 on 2023/09/27.
    //
    
    import UIKit
    
    class RegisterViewController: UIViewController {
        
        // MARK: -  Properties
        // 유효성 검사를 위한 프로퍼티 설정
        var isValidEmail = false
        
        var isValidName = false
        
        var isValNickname = false
        
        var isPassword = false
        
        // Textfields
        @IBOutlet weak var emailTextField: UITextField!
        
        @IBOutlet weak var nameTextField: UITextField!
        
        @IBOutlet weak var nicknameTextField: UITextField!
        
        @IBOutlet weak var passwordTextField: UITextField!
        
        var textFields: [UITextField] {
            [emailTextField, nameTextField, nicknameTextField, passwordTextField]
        }
        
        
        // MARK: - LIfecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setupTextField()
        }
        
        // MARK: - Actions
        
        @objc // TextField와 Action 연결
        func textFieldEditingChanged(_ sender: UITextField){
            let text = sender.text ?? ""
            
            // 어떤 sender로부터 전달받았는지에 따라 다른 기능 수행
            switch sender {
            case emailTextField:
                print("email")
            case nameTextField:
                print("name")
            case nicknameTextField:
                print("nickname")
            case passwordTextField:
                print("password")
            default:
                fatalError("Missing TextField...")
            }
        }
        
        
        
        // MARK: - Helpers
        private func setupTextField(){
            
            textFields.forEach{tf in
                tf.addTarget(self,
                             action:#selector(textFieldEditingChanged(_: )),
                             for:.editingChanged)
            }
        }
    }
    ```
    

# 13. 회원가입 - 유효성 검사 로직

## 1. 💻유효성 검사를 위한 정규표현식 추가하기

```swift
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
```

## 2. 유효성 검사를 모두 통과할 경우 버튼 색상 변경을 위한 메소드 추가

```swift
//사용자가 입력한 회원정보를 확인 -> UI 업데이트
private func validateUserInfo() {
    
    // 아래의 네 항목이 유효성 검사를 통과한다면
    if isValidEmail && isValidName && isValidNickname && isvalidPassword {
        self.signupButton.backgroundColor = UIColor.facebookColor
    }else{
        self.signupButton.backgroundColor = UIColor.disabledButtonColor
    }
}
```

## 3. Action과 유효성 검사 연결하기

### 1) 프로그램 실행

프로그램이 실행되면 setupTextField가 실행되어 textField에 값이 변경되는 것을 감지한다.

```swift
// MARK: - LIfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
```

### 2) 값이 들어올 때 textField에 따라 유효성 검사 진행(Action)

```swift
// MARK: - Actions

@objc // TextField와 Action 연결
func textFieldEditingChanged(_ sender: UITextField){
    let text = sender.text ?? ""
    
    // 어떤 sender로부터 전달받았는지에 따라 다른 기능 수행
    switch sender {
    case emailTextField:
        self.isValidEmail = text.isValidEmail()
    case nameTextField:
        self.isValidName = text.count > 2
    case nicknameTextField:
        self.isValidNickname = text.count > 2
    case passwordTextField:
        self.isvalidPassword = text.isValidPassword()
    default:
        fatalError("Missing TextField...")
    }
}
```

# 14. CornerRadius 적용, UI 버튼색상 변경

## 1) 💻CornerRadius Extension 추가

아래의 swift 파일을 추가하면, inspector에 `Corner Radius`라는 값이 추가된다.

```swift
//
//  UIView+Extension.swift
//  CatStargram
//
//  Created by 강희진 on 2023/09/28.
//

import UIKit

// UIView의 기능확장
extension UIView{
    // Inspector를 추가(=모서리)
    @IBInspectable var cornerRadius: CGFloat{
        get{ // 값을 읽어올 때
            return layer.cornerRadius
        }
        set{ // 값을 세팅할 때
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue>0
        }
    }
}
```

### 1-1) CornerRadius 적용 방법

1. 위의 extension 추가 후 inspector에서 radius 값 주기
2. controller에서 outlet에 넣은 객체를  viewDidLoad()에서 
`signupButton.layer.cornerRadius = 100`과 같은 방식으로 값 주기

## 2) 버튼의 일부분 색상 변경

### 2-1) 💻UIViewController+Extension

아래의 코드를 이용해 색상을 바꾸고자하는 부분을 지정, 색상을 선택해 변경할 수 있다.

```swift
import UIKit

extension UIViewController{
    func generateButtonAttribute(_ button : UIButton,
                                 // ...은 파라미터를 복수로 받을 수 있음을 나타내는 문법
                                 texts: String...,
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString{
    
        
        // UIButton에 입력된 text를 가져온다.
        guard let wholeText = button.titleLabel?.text else { fatalError("버튼에 텍스트가 없음.")}
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        // 설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map{index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        // 설정하고자 하는 색상들
        let customColors = colors
        
        // attribute 객체를 생성한다
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        // 텍스트에 맞는 설정을 추가한다
    
        texts.indices.forEach{ index in
            attributedString.addAttribute(.font, value: customFonts[index], range: customTextsRanges[index])
            attributedString.addAttribute(.foregroundColor,
                                           value: customColors[index],
                                           range: customTextsRanges[index])
        }
        return attributedString
    }
}
```

### 2-2 UIViewController+Extension 사용하기

아래 코드와 같은 형태로 적용 후, viewDidLoad에 넣어 실행시킨다.

```swift
private func setupAttribute() {
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        **let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        // for: .normal = 정상적인 상태에서 attributes가 적용된다.
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)**
    }
```

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        }
```

# 15. Back Button 커스텀

## 1) Back Button 커스텀

1. View Controller의 inspector를 통해 Top Bar에 Translucent Navigation bar 추가
2. 상단에 Navigation Item 추가
3. Bar Button Item 추가
4. 아래의 액션 추가 → 버튼 누를 시 이전 화면으로 감

```swift
@IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        // popViewController: 뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
```

## 2) 슬라이딩을 통해 뒤로가기

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        // bug fix
                // 슬라이딩으로 뒤로가기
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        } 
```

# 16. 회원가입 - 정보 전달

## 1) 화면전환 한 뒤, 이전 화면의 입력받은 정보 가져오기

```swift
// loginViewController.swift
// 화면 전환 후 입력받은 userInfo 가져오기
registerViewController.userInfo = {[weak self](userInfo) in
            self?.userInfo = userInfo
        }
```

참조에 대한 문제가 생길 수 있기 때문에 `[weak self]`와 함께 `Optional`을 사용해준다.

> ARC에 대해 공부하자
weak self를 이용하면 강한참조 → 약한참조로 바뀐다. 
약한 참조는 ARC를 낮춰주며, 메모리가 해제되었을 때 약한 참조로 바뀐 부분을 같이 해제해준다.
⇒ 메모리 낭비 줄임
> 

## 2) 정보 검증 전까지 버튼 비활성화

전달 받은 뒤, 로그인이 가능하기 확인하기 이전까지 로그인 버튼이 눌리지 않기 위해 버튼을 비활성화 시켜야한다.

button의 sytle을 `default`로 해준다.

그리고 잘못된 값이 오면 button의 isEnable을 false해주고, 색상을 바꿔준다.

하지만 enable의 경우 상태에 따라 작동의 여부가 결정되기 때문에 신중히 해야한다.
(강의에서는 enable상태로 

### 전달 받은 값을 넣는 두가지 방법

<aside>
💡 1. 임의의 값을 넣는 방법

```swift
// text의 값이 없다면 ? 뒤의 값을 넣어준다.
let text = sender.text ?? ""
```

1. 함수를 이용해 전달받는 방법

```swift
// guard를 이용해 userInfo가 있게 되면 let에 새롭게 데이터를 만들고, 
// 그렇지 않을 경우 else를 통해 함수 실행이 종료된다.
guard let userInfo = self.userInfo else {return}
```

</aside>

# UITabBarController 추가

## 1) 카테고리가 다른 두 화면을 한 화면에 위치시킬 때 UITabBarController사용

ViewController가 아닌 UITabBarController를 화면에 추가해준다.

## 2) modal presentation 방식 fullscreen으로 바꾸기

단순히 추가하면 modal presentation 방식으로 인해 여백이 존재한다. 

아래의 코드와 같이 화면 전환을 진행할 때, fullscreen방식으로 설정해줌으로써 해결할 수 있다.

```swift
let vc = storyboard? .instantiateViewController(withIdentifier: "TabBarVC") 
                                                                                                        as! UITabBarController
**vc.modalPresentationStyle = .fullScreen**
self.present(vc, animated: true, completion: nil)
```
---

# 섹션 5 - TableView

# TableView 기본

## 1) 프로토콜 지향 언어

### 객체 vs 프로토콜

객체지향언어 = “is a”, 강아지는 동물이다

프로토콜 지향 언어 = “have a”, 강아지는 동물의 ‘특징’을 가지고 있다.

→ 프로토콜 지향 언어는 기능, 능력, 특징을 중심으로 말한다

## 2) ArrayList

### Array와 ArrayList

ArrayList는 Dictionary와 유사

Array = 자리가 지정되어있기 때문에 값이 사라지더라도 순서가 바뀌지 않는다.

ArrayList = 값이 사라진다면, 순서가 바뀔 수 있다.

프로그램이 실행될 때, 값이 사라지더라도 프로그램이 중지되는 것이 아니라, 그대로 진행된다.

값이 비더라도 크기가 계속 조정되기 때문에 null값의 빌드 오류가 발생하지 않는다.

→ ArrayList는 추가, 수정, 삭제에 매우 용이하다.

## 3) DataSource

DataSource : ViewController에게 데이터를 전달해주는 객체

## 4) Delegate

Delegate : 기능을 다른 곳에서도 사용할 수 있게 만들어주는 객체, 기능을 위임

protocol을 통해 기능 구현 → delegate를 통해 기능 위임 → 위임 받은 object에서 protocol 기능 사용

# Delegate 실습

화면이 사라짐과 동시에 데이터를 전달해주기 위해서는 Protocol과 Delegate를 함께 사용해야한다.

```swift
protocol ChangeLabelDelgate {
    func doChange()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
            return
        }
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    var delegate : ChangeLabelDelgate?
}
```

```swift
class SecondViewController: UIViewController, ChangeLabelDelgate {
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
    

    @IBOutlet weak var textField: UITextField!
    var previousViewController : ViewController?
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        //화면을 없애줌
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previousViewController?.delegate=self
    }
}
```
