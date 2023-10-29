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
        tableView.separatorStyle = .none
        
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
    }

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 한 섹션에 몇 개의 cell을 넣을 것인가.
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 어떤 cell을 보여줄 것인가.
        
        if indexPath.row == 0{
            /**
             첫 번째 tableCell에 StoryTableViewCell를  넣기
             */
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell
                else{
                return UITableViewCell()
            }
            return cell
        }else{
            /**
             첫 번째를 제외한 Cell들은 FeedTableViewCell을 넣기
             identifier이름이 "FeedTableCell"인 Cell을 사용한다. 그리고  FeedTableViewCell.Swift를 따른다
             */
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
                //오류가 발생할 경우 기본 TableViewCell을 내보낸다.
                return UITableViewCell()
            }
            //하나의 셀을 클릭했을 때 회색으로 cell의 영역이 보이지 않게 한다
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 80
        } else{
            return 600
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else{
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelgate: self, forRow: indexPath.row)
    }
}

//CollectionView를 사용하려 할 때 UICollectionViewDelegateFlowLayout를 필수적으로 넣어줘야한다.
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    /**
     collectionView는 무조건 width, height를 지정해주어야 한다.
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
}
