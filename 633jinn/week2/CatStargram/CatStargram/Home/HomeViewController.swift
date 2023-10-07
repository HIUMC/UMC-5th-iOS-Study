//
//  HomeViewController.swift
//  CatStargram
//
//  Created by 강희진 on 2023/10/06.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}
extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 한 섹션에 몇 개의 cell을 넣을 것인가.
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 어떤 cell을 보여줄 것인가.
        let cell = UITableViewCell()
        cell.backgroundColor = .blue
        return cell
    }
}
