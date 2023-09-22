//
//  LoginViewController.swift
//  everytime
//
//  Created by sesang on 2021/09/01.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "login_title_icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(w: 166)
        label.textAlignment = .center
        label.text = "네고 생활을 더 편하고 즐겁게"
        label.numberOfLines = 1
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(r: 198, g: 41, b: 23)
        label.textAlignment = .center
        label.text = "에누리타임"
        label.numberOfLines = 1
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "아이디"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = UIColor(w: 242)
        textField.layer.cornerRadius = 20
        textField.clipsToBounds = true
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "비밀번호"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = UIColor(w: 242)
        textField.layer.cornerRadius = 20
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("에누리타임 로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(r: 198, g: 41, b: 23)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(w: 41), for: .normal)
        return button
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private var centerYConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.container)
        self.container.addArrangedSubview(self.titleImageView)
        self.container.addArrangedSubview(self.descriptionLabel)
        self.container.addArrangedSubview(self.titleLabel)
        self.container.addArrangedSubview(self.idTextField)
        self.container.addArrangedSubview(self.passwordTextField)
        self.container.addArrangedSubview(self.loginButton)
        self.container.addArrangedSubview(self.signupButton)
        
        self.container.setCustomSpacing(10, after: self.titleImageView)
        self.container.setCustomSpacing(46, after: self.titleLabel)
        self.container.setCustomSpacing(30, after: self.loginButton)
        
        let constraint = self.container.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([
            self.container.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.container.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            constraint,
            self.titleImageView.heightAnchor.constraint(equalToConstant: 60),
            self.titleImageView.widthAnchor.constraint(equalToConstant: 60),
            self.idTextField.heightAnchor.constraint(equalToConstant: 40),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            self.loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.idTextField.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            
            self.idTextField.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            
            self.loginButton.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.container.trailingAnchor)
        ])
        
        self.loginButton.addTarget(self, action: #selector(onPressLoginButton), for: .touchUpInside)
        self.centerYConstraint = constraint
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else {
            return
        }
        
        
//        self.centerYConstraint?.constant = -keyboardFrame.height
        UIView.animate(withDuration: duration) {
//            [self.titleImageView, self.descriptionLabel, self.titleLabel, self.signupButton].forEach { view in
//                view.alpha = 0
//            }
            self.centerYConstraint?.constant = -keyboardFrame.height
            self.view.layoutIfNeeded()
        }

    }
    
    @objc func keyboardWillHide(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else {
            return
        }
        
//        self.centerYConstraint?.constant = 0
        UIView.animate(withDuration: duration) {
//            [self.titleImageView, self.descriptionLabel, self.titleLabel, self.signupButton].forEach { view in
//                view.alpha = 1
//            }
            self.centerYConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func viewDidTap(gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @objc func onPressLoginButton(sender: Any) {
        let nav = UINavigationController()
        nav.modalPresentationStyle = .fullScreen
        nav.navigationBar.barTintColor = .white
        nav.navigationBar.tintColor = UIColor(w: 42)
        let controller = MainViewController()
        nav.viewControllers = [controller]
        self.present(nav, animated: true, completion: nil)
    }
}



