//
//  ReelsViewController.swift
//  CatStargram
//
//  Created by 강희진 on 2023/12/18.
//

import UIKit
import SnapKit

class ReelsViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var nowPage = 0
    
    private let videoURLStrArr = ["dummyvideo", "dummyvideo02"]
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()

    }
    // MARK: - Actions
    
    // MARK: - Helpers
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        //스크롤이 빨리 넘어갈 수 있도록 속도 조절
        collectionView.decelerationRate = .fast
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
        
        starLoop()
        
//        collectionView.register(UINib(nibName: "ReelsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ReelsCollectionViewCell.identifier)
    }
    
    private func starLoop() {
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.moveNextPage()
        }
    }
    
    private func moveNextPage() {
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        nowPage += 1
        
        if (nowPage >= itemCount){
            // 마지막 페이지
             nowPage = 0
        }
        
        collectionView.scrollToItem(
            at: IndexPath(item: nowPage, section: 0),
            at: .centeredVertically,
            animated: true)
    }
}
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else { return UICollectionViewCell()}
        
        cell.setupURL(videoURLStrArr.randomElement()!)
        return cell
        
        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifier, for: indexPath) as? ReelsCollectionViewCell else { fatalError()}
    }
    
    // 메모리 관리 메소드
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell{
            cell.videoView?.cleanUp()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ReelsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}
