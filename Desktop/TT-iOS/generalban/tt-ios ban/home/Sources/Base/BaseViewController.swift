//
//  BaseViewController.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setUp()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    // MARK: - For overriding
    
    func setUp() { }
    
    func initView() { }
    
    func initConstraint() { }
    
    func bind() { }
    
    // MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initConstraint()
        
        bind()
    }
}
