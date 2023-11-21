//
//  UIViewController+Extension.swift
//  CatStaGram
//
//  Created by 오연서 on 10/9/23.
//

import UIKit

extension UIViewController {
    func generateButtonAttribute(_ button: UIButton, texts: String...,
                                 fonts: UIFont..., colors: UIColor...)
    -> NSMutableAttributedString {
        // UIButton에 입력된 text를 가져온다
        guard let wholeText = button.titleLabel?.text else { fatalError ("no text on button") }
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        //설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts [index])
        }
        
        //설정하고자 하는 색상들
        let customColors = colors
        
        // attribute 객체 생성
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        //텍스트에 맞는 설정 추가
        texts.indices.forEach { index in
            attributedString.addAttribute(.font,
                                          value: customFonts [index],
                                          range: customTextsRanges [index])
            attributedString.addAttribute(.foregroundColor,
                                          value: customColors [index],
                                          range: customTextsRanges [index])
        }
        return attributedString
    }
}
