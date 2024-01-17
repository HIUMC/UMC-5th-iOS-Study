//
//  TeamInviteViewController+InviteCell.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

extension TeamInviteViewController {
    final class InviteCell: BaseTableViewCell {
        
        // MARK: - View
        
        private lazy var containerView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(named: "Cool gray 4")
            
            return view
        }()
        
        private lazy var iconContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(named: "Primary color")
            view.layer.cornerRadius = 22
            view.layer.masksToBounds = true
            
            return view
        }()
        
        private lazy var iconView: UIImageView = {
            UIImageView(image: UIImage(named: "icon_team"))
        }()
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Test Team."
            label.textColor = UIColor(named: "서브 텍스트 1")
            
            return label
        }()
        
        private lazy var buttonStackView: UIStackView = {
            let view = UIStackView()
            view.axis = .horizontal
            view.spacing = 5
            
            return view
        }()
        
        private lazy var rejectButton: Button = {
            Button(.reject)
        }()
        
        private lazy var confirmButton: Button = {
            Button(.confirm)
        }()
        
        // MARK: - UI
        
        override func configureSubviews() {
            super.configureSubviews()
            
            contentView.addSubview(containerView)
            containerView.addSubview(iconContainerView)
            containerView.addSubview(titleLabel)
            containerView.addSubview(buttonStackView)
            
            iconContainerView.addSubview(iconView)
            [rejectButton, confirmButton].forEach { buttonStackView.addArrangedSubview($0) }
        }
        
        override func configureConstraints() {
            super.configureConstraints()
            
            containerView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(6)
                make.leading.trailing.bottom.equalToSuperview()
            }
            
            iconContainerView.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(18)
                make.top.bottom.equalToSuperview().inset(11)
                make.size.equalTo(44)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.leading.equalTo(iconContainerView.snp.trailing).offset(16)
                make.centerY.equalToSuperview()
            }
            
            buttonStackView.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(18)
                make.centerY.equalToSuperview()
            }
            
            iconView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(8)
                make.leading.trailing.equalToSuperview().inset(10)
                make.bottom.equalToSuperview().inset(12)
            }
        }
    }
}

extension TeamInviteViewController.InviteCell {
    static func makeCell(to view: UITableView, indexPath: IndexPath) -> TeamInviteViewController.InviteCell {
        guard let cell = view.dequeueReusableCell(
            withIdentifier: TeamInviteViewController.InviteCell.reuseIdentifier,
            for: indexPath
        ) as? TeamInviteViewController.InviteCell else { fatalError("Cell is not registered to view....") }
        
        return cell
    }
}

extension TeamInviteViewController.InviteCell {
    final class Button: BaseControl {
        
        enum ButtonType {
            case reject
            case confirm
        }
        
        // MARK: - Property
        
        var type: ButtonType? {
            didSet { update() }
        }
        
        // MARK: - View
        
        private lazy var textLabel: UILabel = {
            UILabel()
        }()
        
        // MARK: - Init
        
        convenience init(_ type: ButtonType) {
            defer {
                self.type = type
            }
            
            self.init(frame: .zero)
        }
        
        // MARK: - UI
        
        override func prepare() {
            super.prepare()
            
            layer.cornerRadius = 10
            layer.masksToBounds = true
        }
        
        override func configureSubviews() {
            super.configureSubviews()
            
            addSubview(textLabel)
        }
        
        override func configureConstraints() {
            super.configureConstraints()
            
            snp.makeConstraints { make in
                make.width.equalTo(64)
                make.height.equalTo(32)
            }
            
            textLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }
        
        // MARK: - Bind
        
        override func update() {
            super.update()
            
            switch type {
            case .confirm:
                backgroundColor = UIColor(named: "Point")
                textLabel.text = "수락"
                textLabel.textColor = .white
            case .reject:
                backgroundColor = UIColor(named: "Cool gray 1")
                textLabel.text = "거절"
                textLabel.textColor = .black
            default:
                break
            }
        }
    }
}
