//
//  UIViewController+Extension.swift
//  section4login
//
//  Created by 강삼고 on 2023/10/10.
//

//일부 색상을 변경할때 사용하는 extension
import UIKit

extension UIViewController {
    func generateButtonAttribute(_ button: UIButton,
                                 texts: String..., //...-> 파라미터를 복수로 받을 수 있음을 나타내는
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString {
        //UIButton에 입력된 text를 가져온다.
        guard let wholeText = button.titleLabel?.text else { fatalError("버튼에 텍스트가 없음. ") }
        
        //폰트들
        let customFonts: [UIFont] = fonts
        
        //설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        //설정하고자 하는 색상들
        let customColors = colors
        
        //attribute 객체를 생성한다.
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        //텍스트에 맞는 설정을 추가한다.
        texts.indices.forEach { index in
            attributedString.addAttribute(.font,
                                          value: customFonts[index],
                                          range: customTextsRanges[index])
            
            attributedString.addAttribute(.foregroundColor,
                                          value: customColors [index],
                                          range: customTextsRanges [index])
        }
        return attributedString
    }
    
}
