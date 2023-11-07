//
//  UIView+Extension.swift
//  CatStargram
//
//  Created by 강희진 on 2023/09/28.
//

import UIKit

// UIView의 기능확장
extension UIView{
    // Inspector를 추가(=모서리)
    @IBInspectable var cornerRadius: CGFloat{
        get{ // 값을 읽어올 때
            return layer.cornerRadius
        }
        set{ // 값을 세팅할 때
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue>0
        }
    }
}
