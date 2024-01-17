//
//  TeamInviteViewController.swift
//  home
//
//  Created by 반성준 on 2024/01/16.
//

import UIKit

final class TeamInviteViewController: BaseViewController {
    
    // MARK: - View
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "받은 팀 초대"
        label.textColor = .black
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(InviteCell.self)
        view.rowHeight = UITableView.automaticDimension
        
        return view
    }()
    
    // MARK: - UI
    
    override func setUp() {
        super.setUp()
        
        view.backgroundColor = .black.withAlphaComponent(0.2)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissScreen)))
    }
    
    @objc
    func dismissScreen() {
        dismiss(animated: true)
    }
    
    override func initView() {
        super.initView()
        
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(tableView)
        
        tableView.dataSource = self
    }
    
    override func initConstraint() {
        super.initConstraint()
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(129)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(450)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(19)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(9)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension TeamInviteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        InviteCell.makeCell(to: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
