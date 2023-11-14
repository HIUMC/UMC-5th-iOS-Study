//
//  UIViewController+Extension.swift
//  Catstagram
//
//  Created by Seyoung on 10/31/23.
//

import UIKit

extension UIViewController {
    func generateButtonAttribute(_ button: UIButton, texts: String..., fonts: UIFont..., colors: UIColor...) -> NSMutableAttributedString {
        // UIButton에 입력된 text를 가져온다.
        guard let wholeText = button.titleLabel?.text else{ fatalError("버튼에 텍스트가 없음")}
        
        //fonts
        let customFonts: [UIFont] = fonts
        
        //Setting String's NSRanges
        let customTextsRanges = texts.indices.map { index in(wholeText as NSString).range(of: texts[index])}
        
        //Setting colors
        let customColors = colors
        
        //create attribute
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        //text setting
        texts.indices.forEach { index in 
            attributedString.addAttribute(.font, value: customFonts[index], range: customTextsRanges[index])
            attributedString.addAttribute(.foregroundColor, value: customColors[index], range: customTextsRanges[index])
        }
        return attributedString
    
    }
    
}
