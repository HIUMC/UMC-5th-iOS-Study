//
//  UIView+Extenstion.swift
//  Catstagram
//
//  Created by Seyoung on 10/31/23.
//

import UIKit

extension UIView {
    //항목 추가
    @IBInspectable var conerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
