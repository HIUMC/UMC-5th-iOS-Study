//
//  BaseControl.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

class BaseControl: UIControl {
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
    
    open func prepare() { }
    
    open func configureSubviews() { }
    
    open func configureConstraints() { }
    
    open func bindEvents() { }
    
    open func update() { }
}
