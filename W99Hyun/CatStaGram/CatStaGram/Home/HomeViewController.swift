//
//  HomeViewController.swift
//  CatStaGram
//
//  Created by 오연서 on 10/30/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self // self = UIViewController
        tableView.dataSource = self
        tableView.separatorStyle = .none
        //FeedViewCell을 등록
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
    }

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //한 섹션에 몇 개의 셀을 넣을 건지
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 { //첫번째 제외
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell
            else{
                return UITableViewCell() //오류라면 기본 셀 실행
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? StoryTableViewCell
            else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    //한 피드의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        }
         
        else {
            return 600
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }//tableviewwill display~ 함수
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as?
                StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { //크기를 무조건 설정해줘야됨.
        return CGSize(width: 50, height: 60)
    }
}
