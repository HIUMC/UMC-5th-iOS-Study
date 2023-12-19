//
//  ViewController.swift
//  PapagoAPI
//
//  Created by Dongwan Ryoo on 12/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var beforeTranslateTextView: UITextView!
    @IBOutlet var afterTranslateTextView: UITextView!
    @IBOutlet var langSelectTextField: UITextField!
    @IBOutlet var translateButton: UIButton!
    let pickerView = UIPickerView()
    var targetLnag: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        langSelectTextFieldSet(langSelectTextField)

    }
}

//MARK: - translateButton 관련 코드
extension ViewController {
    
    func addTarget() {
        translateButton.addTarget(self, action: #selector(translateButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func translateButtonTapped() {
        callRequestTranslateLangs(targetLnag)
    }
}

//MARK: - langSelectTextField 관련 코드
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func langSelectTextFieldSet(_ textField: UITextField) {
        textField.placeholder = "언어를 선택해주세요."
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return LangType.langDic.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let keyArray = Array(LangType.langDic.keys)
        langSelectTextField.text = keyArray[row]
        
        let valueArray = Array(LangType.langDic.values)
        targetLnag = valueArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let keyArray = Array(LangType.langDic.keys)
        let langText = keyArray[row]
        return langText
    }
    
}

//MARK: - Network 관련 코드
extension ViewController {
    
    func callRequestTranslateLangs(_ targetLnag: String) {
        let url = 
        
        let prameter:Parameters = [
            "source" : LangType.langDic["한국어"],
            "target" : targetLnag,
            "text" : beforeTranslateTextView.text ?? ""
        ]
        
        AF.request(url, 
                   method: .post, 
                   parameters: prameter,
                   headers: APIKey.NAVERKey).validate().responseJSON { response in 
            
            switch response.result {
            case .success(let value):
                
                print(value)
            case .failure(let error):
                
                print(error)
            }
        }   
    }
}
