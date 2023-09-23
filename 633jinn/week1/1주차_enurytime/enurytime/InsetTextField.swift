//
//  InsetTextField.swift
//  enurytime
//
//  Created by 강희진 on 2023/09/19.
//

import Foundation
import UIKit

class InsetTextField: UITextField{
    
    var insetX: CGFloat = 0 {
        // insetX가 바뀌면 아래의 didSet이 불림
        didSet{
            layoutIfNeeded()
        }
    }
    var insetY: CGFloat = 0 {
        didSet{
            layoutIfNeeded()
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
}
