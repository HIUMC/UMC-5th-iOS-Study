//
//  BaseTableViewCell.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    public class var reuseIdentifier: String { "\(self).identifier" }
    
    func prepare() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func configureSubviews() { }
    
    func configureConstraints() { }
    
    func bindEvents() { }
    
    func update() { }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        prepare()
        
        configureSubviews()
        configureConstraints()
        
        bindEvents()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        prepare()
        
        configureSubviews()
        configureConstraints()
        
        bindEvents()
    }
}
