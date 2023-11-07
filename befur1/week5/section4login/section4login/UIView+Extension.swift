//
//  UIView+Extension.swift
//  section4login
//
//  Created by 강삼고 on 2023/10/10.
//

import UIKit

extension UIView{ //UIView 기능 확장
    @IBInspectable var cornerRadius: CGFloat{ //Interface Builder에 다음을 인스펙터 (항목)으로 사용할 수 있다. 모서리 따기
        get{
            return layer.cornerRadius //해당 UIView의 layer의 cornerRadius 수치를 가져온다
        }
        set{
            layer.cornerRadius=newValue
            layer.masksToBounds=newValue>0
        }
    }
}
