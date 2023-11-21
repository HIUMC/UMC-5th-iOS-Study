//
//  UIView+Extension.swift
//  CatStaGram
//
//  Created by 오연서 on 10/9/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { //모서리를 부드럽게
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
