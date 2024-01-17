//
//  TeamViewController+CreateTeamButtonView.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

extension TeamViewController {
    final class CreateTeamButtonView: BaseView {
        
        // MARK: - View
        
        private(set) lazy var button: CreateTeamButton = {
            CreateTeamButton()
        }()
        
        // MARK: - UI
        
        override func prepare() {
            super.prepare()
            
            backgroundColor = .white
        }
        
        override func configureSubviews() {
            super.configureSubviews()
            
            addSubview(button)
        }
        
        override func configureConstraints() {
            super.configureConstraints()
            
            button.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.top.bottom.equalToSuperview().inset(16)
                make.height.equalTo(56)
            }
        }
    }
}
