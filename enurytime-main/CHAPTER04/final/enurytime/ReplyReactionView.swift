//
//  ReplyReactionView.swift
//  everytime
//
//  Created by sesang on 2021/09/02.
//

import Foundation
import UIKit

final class ReplyReactionView: UIStackView {
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "detail_reply_comment"), for: .normal)
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "detail_reply_like"), for: .normal)
        return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "detail_reply_more"), for: .normal)
        return button
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(w: 249)
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    private func makeSeparator() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(w: 214)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 1),
            view.heightAnchor.constraint(equalToConstant: 8)
        ])
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.spacing = 0
        self.axis = .horizontal
        self.alignment = .center
        self.addSubview(self.backgroundView)
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        self.addArrangedSubview(self.commentButton)
        self.addArrangedSubview(self.makeSeparator())
        self.addArrangedSubview(self.likeButton)
        self.addArrangedSubview(self.makeSeparator())
        self.addArrangedSubview(self.moreButton)
        [self.commentButton, self.likeButton, self.moreButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 36),
                view.topAnchor.constraint(equalTo: self.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
