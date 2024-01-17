//
//  NewTeamViewController+NewTeamButtonView.swift
//  home
//
//  Created by 반성준 on 2024/01/17.
//

import UIKit

extension NewTeamViewController {
    final class NewTeamButtonView: BaseControl {
        
        // MARK: - View
        
        private lazy var iconView: UIImageView = {
            let view = UIImageView(image: UIImage(named: "icon_team_plus"))
            view.isUserInteractionEnabled = false
            
            return view
        }()
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "팀원 추가"
            label.textColor = .black
            
            return label
        }()
        
        // MARK: - UI
        
        override func configureSubviews() {
            super.configureSubviews()
            
            addSubview(iconView)
            addSubview(titleLabel)
        }
        
        override func configureConstraints() {
            super.configureConstraints()
            
            iconView.snp.makeConstraints { make in
                make.top.leading.bottom.equalToSuperview()
                make.size.equalTo(34)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.leading.equalTo(iconView.snp.trailing).offset(10)
                make.trailing.equalToSuperview()
                make.centerY.equalToSuperview()
            }
        }
    }
}
