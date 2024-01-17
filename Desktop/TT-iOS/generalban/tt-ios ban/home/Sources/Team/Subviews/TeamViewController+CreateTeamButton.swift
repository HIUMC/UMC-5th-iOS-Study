//
//  TeamViewController+CreateTeamButton.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

extension TeamViewController {
    final class CreateTeamButton: BaseControl {
        
        // MARK: - View
        
        private lazy var layoutView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(named: "Primary color")
            view.layer.cornerRadius = 10
            view.layer.masksToBounds = true
            view.isUserInteractionEnabled = false
            
            return view
        }()
        
        private lazy var stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .horizontal
            view.alignment = .center
            
            return view
        }()
        
        private lazy var plusIconView: UIImageView = {
            UIImageView(image: UIImage(named: "icon_plus"))
        }()
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.text = "새로운 팀 만들기"
            
            return label
        }()
        
        // MARK: - UI
        
        override func configureSubviews() {
            super.configureSubviews()
            
            addSubview(layoutView)
            layoutView.addSubview(stackView)
            
            [plusIconView, titleLabel].forEach { stackView.addArrangedSubview($0) }
        }
        
        override func configureConstraints() {
            super.configureConstraints()
            
            layoutView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            stackView.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            
            plusIconView.snp.makeConstraints { make in
                make.size.equalTo(30)
            }
        }
    }
}
