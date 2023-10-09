//
//  LoginViewController.swift
//  enurytime
//
//  Created by 강희진 on 2023/09/19.
//

import Foundation
import UIKit

final class LoginViewController:UIViewController{
    
    private let titleImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "login_title_icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(w: 166)
        label.textAlignment = .center
        label.text = "네고 생활을 더 편하고 즐겁게"
        label.numberOfLines = 1
        return label
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(r: 198, g: 41, b: 23)
        label.textAlignment = .center
        label.text = "에누리타임"
        label.numberOfLines = 1
        return label
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints=false
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private let idTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "아이디"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = UIColor(w:242)
        textField.layer.cornerRadius = 20
        textField.clipsToBounds = true // 추가해줘야 radius 정상작동
        return textField
    }()
    
    private let passwordTextField: InsetTextField = {
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "비밀번호"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = UIColor(w:242)
        textField.layer.cornerRadius = 20
        textField.clipsToBounds = true // 추가해줘야 radius 정상작동
        textField.isSecureTextEntry = true // 입력할 때 값이 보이지 않음
        return textField
    }()
    
    private let loginButton:UIButton = {
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
    
    private let signupButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(w: 41), for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
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
        // 시계 이미지와 아래 글자 간격 늘리기 (기본 spacing = 4)
        
        self.container.setCustomSpacing(46, after: self.titleLabel)
        
        self.container.setCustomSpacing(30, after: self.loginButton)
        
        // autolayout 설정
        NSLayoutConstraint.activate([
            self.container.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:50),
            self.container.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.container.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.titleImageView.heightAnchor.constraint(equalToConstant: 60),
            self.titleImageView.widthAnchor.constraint(equalToConstant: 60),

            //입력창 길이 제한을 container로 설정
            self.idTextField.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.idTextField.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.idTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.loginButton.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 40),
        ])

    }
}
