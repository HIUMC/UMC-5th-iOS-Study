import UIKit

class LoginViewController: UIViewController {
    
  
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

        guard let userInfo = self.userInfo else {return}
        
        if userInfo.email == self.email
            && userInfo.password == self.password{
            let vc = storyboard? .instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        } else{
            self.loginButton.backgroundColor = .disabledButtonColor
            self.loginButton.isEnabled = false
        }
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
  
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
     
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
     

        self.navigationController?.pushViewController(registerViewController, animated: true)
        
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
        
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
