//
//  MainCell.swift
//  everytime
//
//  Created by sesang on 2021/09/01.
//

import Foundation
import UIKit

final class MainCell: UITableViewCell {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "main_profile_icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(w: 41)
        label.textAlignment = .left
        label.text = "익명"
        label.numberOfLines = 1
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(w: 166)
        label.textAlignment = .right
        label.text = "27분 전"
        label.numberOfLines = 1
        return label
    }()
    
    private let nicknameContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(w: 68)
        label.textAlignment = .left
        label.text = "걸러야하는 연구실 몇개 있는데… ㅋㅋ 무서워서 못 말하겠다"
        label.numberOfLines = 0
        return label
    }()
    
    private let reactionView = ReactionView()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(w: 237)
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        self.contentView.addSubview(self.nicknameContainer)
        self.nicknameContainer.addArrangedSubview(self.profileImageView)
        self.nicknameContainer.addArrangedSubview(self.nicknameLabel)
        self.nicknameContainer.addArrangedSubview(self.timeLabel)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.separator)
        self.contentView.addSubview(self.reactionView)
        self.nicknameContainer.translatesAutoresizingMaskIntoConstraints = false
        self.profileImageView.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.reactionView.translatesAutoresizingMaskIntoConstraints = false
        self.separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nicknameContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.nicknameContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            self.nicknameContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
            self.nicknameContainer.heightAnchor.constraint(equalToConstant: 24),
            self.profileImageView.heightAnchor.constraint(equalToConstant: 24),
            self.profileImageView.widthAnchor.constraint(equalToConstant: 24),
            self.titleLabel.topAnchor.constraint(equalTo: self.nicknameContainer.bottomAnchor, constant: 4),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -24),
            self.separator.heightAnchor.constraint(equalToConstant: 1),
            
            self.separator.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.separator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            self.separator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            
            self.reactionView.heightAnchor.constraint(equalToConstant: 16),
            self.reactionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            self.reactionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6),
            
        ])
        
    }
    
    func setData(text: String) {
        self.titleLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
