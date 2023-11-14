//
//  UIView + Extension.swift
//  catstargram
//
//  Created by 이지우 on 2023/09/25.
//

import UIKit

extension UIView {  // UIView의 기능확장을 함.
    @IBInspectable var cornerRadius: CGFloat {  // 모서리를 부드럽게 해주는 것.
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
