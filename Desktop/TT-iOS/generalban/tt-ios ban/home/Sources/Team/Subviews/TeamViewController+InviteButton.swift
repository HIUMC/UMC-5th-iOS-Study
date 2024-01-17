//
//  TeamViewController+InviteButton.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

extension TeamViewController {
    final class InviteButton: BaseControl {
        
        // MARK: - View
        
        private lazy var containerView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(named: "Primary color")
            view.layer.cornerRadius = 22
            view.layer.masksToBounds = true
            view.isUserInteractionEnabled = false
            
            return view
        }()
        
        private lazy var iconView: UIImageView = {
            let view = UIImageView(image: UIImage(named: "icon_letter"))
            view.isUserInteractionEnabled = false
            
            return view
        }()
        
        // MARK: - UI
        
        override func configureSubviews() {
            super.configureSubviews()
            
            addSubview(containerView)
            containerView.addSubview(iconView)
        }
        
        override func configureConstraints() {
            super.configureConstraints()
            
            containerView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.size.equalTo(44)
            }
            
            iconView.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.size.equalTo(24)
            }
        }
    }
}
