//
//  TeamViewController+TopView.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

extension TeamViewController {
    final class TopView: BaseView {
        
        // MARK: - View
        
        private lazy var textLabel: UILabel = {
            let label = UILabel()
            label.text = "참여중인 팀 목록입니다."
            label.textColor = .black
            
            return label
        }()
        
        // MARK: - UI
        
        override func prepare() {
            super.prepare()
            
            backgroundColor = UIColor(named:"메뉴 배경 1")
        }
        
        override func configureSubviews() {
            super.configureSubviews()
            
            addSubview(textLabel)
        }
        
        override func configureConstraints() {
            super.configureConstraints()
            
            textLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(46)
                make.leading.trailing.equalToSuperview().inset(20)
            }
        }
    }
}
