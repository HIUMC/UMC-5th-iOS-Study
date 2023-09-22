//
//  MainViewController.swift
//  everytime
//
//  Created by sesang on 2021/09/01.
//

import Foundation
import UIKit

final class MainViewController: UITableViewController {
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.navigationItem.titleView = NavigationTitleView()
        self.tableView.separatorStyle = .none
        self.tableView.register(MainCell.self, forCellReuseIdentifier: "MainCell")
        self.tableView.reloadData()
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more_title"), style: .plain, target: self, action: nil)
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return texts.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.setData(text: texts[indexPath.item])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
