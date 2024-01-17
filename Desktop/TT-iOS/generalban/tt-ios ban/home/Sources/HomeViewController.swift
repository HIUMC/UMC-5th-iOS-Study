//
//  HomeViewController.swift
//  home
//
//  Created by 오연서 on 1/14/24.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    
    // 배너를 담을 UIView
    let bannerView = UIView()
    
    // 스크롤을 담당할 UIScrollView
    let scrollView = UIScrollView()
    
    //알람 버튼
    lazy var alarmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "alarm"), for: .normal)
        button.tintColor = UIColor(named: "활성화 테두리")
        return button
    }()
    
    // Ticket-Taka 에 오신 것을 환영합니다.
    lazy var welcomeText: UILabel = {
        let label = UILabel()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        let baseAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "SFProDisplay-Medium", size: 27) ?? UIFont.systemFont(ofSize: 27)]
        let attributedText = NSMutableAttributedString(string: "NAME 님,\nTicket-Taka 에\n오신 것을 환영합니다.", attributes: baseAttributes)
        
        // 줄 간의 간격 조정
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        
        // "(이름)"에 대한 폰트 지정
        attributedText.addAttribute(.font, value: UIFont(name: "SFProDisplay-Semibold", size: 27) ?? UIFont.systemFont(ofSize: 27), range: NSRange(location: 0, length: 5))
        
        // "Ticket-Taka"에 대한 폰트 지정
        attributedText.addAttribute(.font, value: UIFont(name: "SFProDisplay-Semibold", size: 27) ?? UIFont.systemFont(ofSize: 27), range: NSRange(location: 7, length: 12))
        
        label.attributedText = attributedText
        label.textAlignment = .left
        label.numberOfLines = 3
        
        return label
    }()
    
    
    
    
    func addView() {
            [bannerView, scrollView].forEach { view in self.view.addSubview(view)}
            [alarmButton, welcomeText].forEach { view in bannerView.addSubview(view)}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        bannerView.backgroundColor = UIColor(named:"메뉴 배경 1")
        scrollView.backgroundColor = .white

        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 200) // 아래로 스크롤 할 수 있는 크기를 설정
        scrollView.addSubview(bannerView)
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        bannerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(272)
            make.width.equalToSuperview()
            
        }
        
        alarmButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56)
            make.left.equalToSuperview().offset(332)
        }
        
        welcomeText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(97)
            make.left.equalToSuperview().offset(20)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    // UIScrollViewDelegate에서 스크롤 이벤트를 처리
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let offsetY = scrollView.contentOffset.y

           if offsetY > 100 { // 스크롤이 일정 이상 내려갔을 때 배너를 숨김
               bannerView.isHidden = true
           } else {
               bannerView.isHidden = false
           }
       }
}
