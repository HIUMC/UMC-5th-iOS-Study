//
//  RoundButton.swift
//  Calculator
//
//  Created by 반성준 on 2023/09/26.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
