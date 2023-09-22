//
//  DetailViewController.swift
//  everytime
//
//  Created by sesang on 2021/09/01.
//

import Foundation
import UIKit


final class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    private let texts = [
        """
        윈도우 노트북 쓰는데 갑자기 이상해졌어요
        바탕화면에 있는 거 삭제하면 아이콘은 그대로 남아 있고, 실행하려고 하면 이미 삭제된 파일이라고 떠요
        폴더나 파일 이름을 바꾸려고 하면 그 위치에 없는 파일이라면서 안 돼요
        크롬에서 다운로드한 파일 바탕화면으로 가게 해놨는데 바탕화면에서 안 보여요
        """,
        "오늘 컴구 첫수업 듣고 고민하는 사람 얼마나 있냐",
        "요즘 D.P 이야기 많이하길래 dynamic programming이 대중의 수면위로 올라온줄안 애붕이 있나?",
        """
        윈도우 노트북 쓰는데 갑자기 이상해졌어요
        바탕화면에 있는 거 삭제하면 아이콘은 그대로 남아 있고, 실행하려고 하면 이미 삭제된 파일이라고 떠요
        폴더나 파일 이름을 바꾸려고 하면 그 위치에 없는 파일이라면서 안 돼요
        크롬에서 다운로드한 파일 바탕화면으로 가게 해놨는데 바탕화면에서 안 보여요
        """,
        "오늘 컴구 첫수업 듣고 고민하는 사람 얼마나 있냐",
        "요즘 D.P 이야기 많이하길래 dynamic programming이 대중의 수면위로 올라온줄안 애붕이 있나?",
    ]
    
    
    private let replyTextView = ReplyTextView()

    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.replyTextView)
//        self.tableView.setContentHuggingPriority(.defaultLow, for: .vertical)
//        
//        self.replyTextView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.replyTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
          
            self.replyTextView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 8),
            
            self.replyTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            self.replyTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8),
            self.replyTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
            
        ])
        self.tableView.backgroundColor = .white
        
        self.navigationItem.titleView = NavigationTitleView()
        self.tableView.register(DetailContentView.self, forHeaderFooterViewReuseIdentifier: "DetailContentView")
        self.tableView.register(DetailReplyCell.self, forCellReuseIdentifier: "DetailReplyCell")
        self.tableView.reloadData()
        self.tableView.separatorStyle = .none
        self.tableView.layoutIfNeeded()

        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more_title"), style: .plain, target: self, action: nil)
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailReplyCell", for: indexPath) as! DetailReplyCell
        cell.setupData(text: self.texts[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DetailContentView") as! DetailContentView
        return view
    }
    
    
    
}
