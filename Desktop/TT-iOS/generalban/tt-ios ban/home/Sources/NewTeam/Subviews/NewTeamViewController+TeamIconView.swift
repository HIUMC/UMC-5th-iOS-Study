//
//  NewTeamViewController+TeamIconView.swift
//  home
//
//  Created by 반성준 on 2024/01/17.
//

import UIKit

extension NewTeamViewController {
    final class TeamIconView: BaseView {
        
        // MARK: - View
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "팀 아이콘"
            
            return label
        }()
        
        private lazy var defaultIconView: IconView = {
            IconView(imageName: "icon_team", bgColor: UIColor(named: "Primary color")!, text: "기본")
        }()
        
        private lazy var addPhotoView: IconView = {
            IconView(imageName: "icon_photo", bgColor: UIColor(named: "Cool gray 5")!, text: "사진 추가")
        }()
        
        // MARK: - UI
        
        override func configureSubviews() {
            super.configureSubviews()
            
            addSubview(titleLabel)
            addSubview(defaultIconView)
            addSubview(addPhotoView)
        }
        
        override func configureConstraints() {
            super.configureConstraints()
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
            }
            
            defaultIconView.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(9)
                make.leading.equalToSuperview()
            }
            
            addPhotoView.snp.makeConstraints { make in
                make.top.equalTo(defaultIconView)
                make.leading.equalTo(defaultIconView.snp.trailing).offset(11)                
            }
        }
    }
}

extension NewTeamViewController {
    final class IconView: BaseControl {
        
        // MARK: - Property
        
        var imageName: String? {
            didSet { update() }
        }
        var bgColor: UIColor? {
            didSet { update() }
        }
        var text: String? {
            didSet { update() }
        }
        
        // MARK: - View
        
        private lazy var iconContainerView: UIView = {
            let view = UIView()
            view.layer.borderWidth = 2
            view.layer.borderColor = UIColor(named: "Point")?.cgColor
            view.layer.cornerRadius = 22
            view.layer.masksToBounds = true
            
            return view
        }()
        
        private lazy var iconView: UIImageView = {
            UIImageView(image: UIImage(named: "icon_team"))
        }()
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor(named: "서브 텍스트 1")
            
            return label
        }()
        
        // MARK: - Init
        
        convenience init(imageName: String, bgColor: UIColor, text: String) {
            defer {
                self.imageName = imageName
                self.bgColor = bgColor
                self.text = text
            }
            
            self.init(frame: .zero)
        }
        
        // MARK: - UI
        
        override func configureSubviews() {
            super.configureSubviews()
            
            addSubview(iconContainerView)
            iconContainerView.addSubview(iconView)
            addSubview(titleLabel)
        }
        
        override func configureConstraints() {
            super.configureConstraints()
            
            iconContainerView.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                make.size.equalTo(44)
            }
            
            iconView.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.size.equalTo(24)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(iconContainerView.snp.bottom).offset(5)
                make.bottom.equalToSuperview()
                make.centerX.equalToSuperview()
            }
        }
        
        // MARK: - Bind
        
        override func update() {
            super.update()
            
            if let imageName {
                iconContainerView.backgroundColor = bgColor
                iconView.image = UIImage(named: imageName)
            }
            titleLabel.text = text
        }
    }
}
