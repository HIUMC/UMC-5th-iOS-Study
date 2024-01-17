//
//  TeamTableViewCell.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

import SnapKit

class TeamItemTableViewCell: BaseTableViewCell {
    
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
        label.text = "Test 입니다."
        label.textColor = UIColor(named: "서브 텍스트 1")
        
        return label
    }()
    
    private lazy var rightIconContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Point")
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var rightIconView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "icon_right"))
        view.tintColor = .white
        
        return view
    }()
    
    // MARK: - UI
    
    override func configureSubviews() {
        super.configureSubviews()
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(iconContainerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(rightIconContainerView)

        iconContainerView.addSubview(iconView)
        rightIconContainerView.addSubview(rightIconView)
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(19)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        iconContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconContainerView.snp.trailing).offset(17)
            make.trailing.lessThanOrEqualTo(rightIconContainerView.snp.leading).offset(-16)
            make.centerY.equalToSuperview()
        }
        
        rightIconContainerView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(38)
        }
        
        iconView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(12)
        }
        
        rightIconView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(18)
        }
    }
}

extension TeamItemTableViewCell {
    static func makeCell(to view: UITableView, indexPath: IndexPath) -> TeamItemTableViewCell {
        guard let cell = view.dequeueReusableCell(
            withIdentifier: TeamItemTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? TeamItemTableViewCell else { fatalError("Cell is not registered to view....") }
        
        return cell
    }
}
