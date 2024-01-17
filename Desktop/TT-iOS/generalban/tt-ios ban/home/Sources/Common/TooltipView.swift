//
//  TooltipView.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

import SnapKit
import EasyTipView

class TooltipView: EasyTipView {
    
    // MARK: - Property
    
    static private let customPrefrence: EasyTipView.Preferences = {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.foregroundColor = .black
        preferences.drawing.backgroundColor = .clear
        preferences.drawing.borderWidth = 1
        preferences.drawing.borderColor = UIColor(named: "Point")!
        preferences.drawing.arrowPosition = .right
        preferences.drawing.cornerRadius = 10
        preferences.positioning.contentInsets = UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 12)
        return preferences
    }()
    
    // MARK: - Init
    
    convenience init(text: String) {
        self.init(text: text, preferences: TooltipView.customPrefrence)
        
        prepare()
    }
    
    private func prepare() {
        layer.zPosition = .greatestFiniteMagnitude
    }
}
