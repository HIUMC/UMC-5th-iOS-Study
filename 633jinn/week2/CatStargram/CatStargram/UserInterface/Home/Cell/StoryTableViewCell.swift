//
//  StoryTableViewCell.swift
//  CatStargram
//
//  Created by 강희진 on 2023/10/29.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelgate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row : Int){
        collectionView.delegate = dataSourceDelgate
        collectionView.dataSource = dataSourceDelgate
        collectionView.tag = row
        
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        //스크롤 방향 상하->좌우로 변경
        flowLayout.scrollDirection = .horizontal
        //cell의 모서리로부터 얼마나 떨어져있는지 설정
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //cell 사이의 최소 간격 설정
        flowLayout.minimumLineSpacing = 12
        
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.reloadData()//cell이 등록되었을 때 재실행
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
