//
//  BaseView.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

class BaseView: UIView {
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        prepare()
        
        configureSubviews()
        configureConstraints()
        
        bindEvents()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepare()
        
        configureSubviews()
        configureConstraints()

        bindEvents()
    }
    
    func prepare() { }
    
    func configureSubviews() { }
    
    func configureConstraints() { }
    
    func bindEvents() { }
    
    func update() { }
}
