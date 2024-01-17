//
//  TeamViewController.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class TeamViewController: BaseViewController {
    
    // MARK: - Property
    
    var topViewHeight: Constraint?
    var isCompleteLayout: Bool = false
    let disposeBag = DisposeBag()
    
    // MARK: - View
    
    private lazy var topView: TopView = {
        TopView()
    }()
    
    private lazy var layoutView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(TeamItemTableViewCell.self)
        view.rowHeight = UITableView.automaticDimension
        
        return view
    }()
    
    private lazy var createTeamButton: CreateTeamButtonView = {
        CreateTeamButtonView()
    }()
    
    private lazy var alarmButton: UIImageView = {
        UIImageView(image: UIImage(named: "alarm"))
    }()
    
    private lazy var inviteButton: InviteButton = {
        InviteButton()
    }()
    
    private lazy var toolTipView: TooltipView = {
        TooltipView(text: "새로운 팀 초대가 도착했어요!")
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        isCompleteLayout = true
        toolTipView.show(animated: false, forView: inviteButton, withinSuperview: view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - UI
    
    override func setUp() {
        super.setUp()
        
        view.backgroundColor = UIColor(named:"메뉴 배경 1")
    }
    
    override func initView() {
        super.initView()
        
        view.addSubview(topView)
        view.addSubview(layoutView)
        view.addSubview(createTeamButton)
        view.addSubview(alarmButton)
        view.addSubview(inviteButton)
        view.addSubview(toolTipView)
        
        layoutView.delegate = self
        layoutView.dataSource = self
    }
    
    override func initConstraint() {
        super.initConstraint()
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            topViewHeight = make.height.equalTo(110).constraint
        }
        
        layoutView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(createTeamButton.snp.top)
        }
        
        createTeamButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        alarmButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(12)
            make.trailing.equalToSuperview().inset(19)
            make.size.equalTo(24)
        }
        
        inviteButton.snp.makeConstraints { make in
            make.bottom.equalTo(createTeamButton.snp.top)
            make.trailing.equalToSuperview().inset(20)
        }
        
        toolTipView.snp.makeConstraints { make in
            make.trailing.equalTo(inviteButton.snp.leading).offset(-8)
            make.centerY.equalTo(inviteButton)
        }
    }
    
    override func bind() {
        super.bind()
        
        inviteButton.rx.controlEvent(.touchUpInside)
            .bind(with: self) { owner, _ in
                owner.presentInviteVIewController()
            }
            .disposed(by: disposeBag)
        
        createTeamButton.button.rx.controlEvent(.touchUpInside)
            .bind(with: self) { owner, _ in
                owner.presentNewTeamViewController()
            }
            .disposed(by: disposeBag)
    }
    
    private func presentInviteVIewController() {
        let viewController = TeamInviteViewController()
        viewController.modalPresentationStyle = .overCurrentContext
        present(viewController, animated: true)
    }
    
    private func presentNewTeamViewController() {
        let viewController = NewTeamViewController()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension TeamViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        TeamItemTableViewCell.makeCell(to: tableView, indexPath: indexPath)
    }
}

extension TeamViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard isCompleteLayout else { return }
        
        if scrollView.contentOffset.y > 0, topView.frame.size.height > 0 {
            updateTopViewHeight(0)
        } else if scrollView.contentOffset.y < 0, topView.frame.size.height == 0 {
            updateTopViewHeight(110)
        }
    }
    
    private func updateTopViewHeight(_ offset: Double) {
        UIView.animate(withDuration: 0.3) {
            self.topViewHeight?.update(offset: offset)
            self.view.layoutIfNeeded()
        } completion: { _ in
            
        }
    }
}
