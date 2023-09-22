//
//  DetailReplyCell.swift
//  everytime
//
//  Created by sesang on 2021/09/01.
//

import Foundation
import UIKit

final class DetailReplyCell: UITableViewCell {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "detail_reply_profile")
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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(w: 68)
        label.textAlignment = .left
        label.text = "걸러야하는 연구실 몇개 있는데… ㅋㅋ 무서워서 못 말하겠다"
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor(w: 166)
        label.textAlignment = .left
        label.text = "08/30 20:51"
        label.numberOfLines = 1
        return label
    }()
    
    private let nicknameContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        return stackView
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(w: 237)
        return view
    }()
    
    private let replyReactionView = ReplyReactionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.addSubview(self.container)
        self.contentView.addSubview(self.replyReactionView)
        self.container.addArrangedSubview(self.nicknameContainer)
        self.container.addArrangedSubview(titleLabel)
        self.container.addArrangedSubview(timeLabel)
        
        self.replyReactionView.translatesAutoresizingMaskIntoConstraints = false
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.nicknameContainer.addArrangedSubview(self.profileImageView)
        self.nicknameContainer.addArrangedSubview(self.nicknameLabel)
        
        self.container.addSubview(self.separator)
        self.separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            self.container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
            self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6),
            self.nicknameContainer.heightAnchor.constraint(equalToConstant: 24),
            self.profileImageView.widthAnchor.constraint(equalToConstant: 24),
            self.separator.heightAnchor.constraint(equalToConstant: 1),
            
            self.separator.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.separator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            self.separator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            self.replyReactionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.replyReactionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
            self.replyReactionView.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupData(text: String) {
        self.titleLabel.text = text
    }
}
