//
//  UIViewController+Extension.swift
//  catstargram
//
//  Created by 이지우 on 2023/09/25.
//

import UIKit

extension UIViewController {  // 이
    func generateButtonAttribute(_ button: UIButton, texts: String..., fonts: UIFont..., colors: UIColor...) -> NSMutableAttributedString { // ...은 파라미터를 복수로 받을 수 있는 것이다. 이속성을 적용하면 원하는 위치만큼의 색상을 변경시킬 수 있다.
        
        //UIButton에 입략된 text를 가져온다.
        guard let wholeText = button.titleLabel?.text else { fatalError("버튼에 텍스트가 없음.")}
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        // 설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map { index in (wholeText as NSString).range(of: texts[index])
        }
        
        // 설정하고자 하는 색상들
        let customColors = colors
        
        // attribute 객체를 생성한다.
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        // 텍스트에 맞는 설정을 추가한다.
        texts.indices.forEach { index in attributedString.addAttribute(.font, value: customFonts[index], range: customTextsRanges[index])
            
        }
        return attributedString
    }
}
