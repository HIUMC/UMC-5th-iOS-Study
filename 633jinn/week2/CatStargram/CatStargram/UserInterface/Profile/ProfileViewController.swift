//
//  ProfileViewController.swift
//  CatStargram
//
//  Created by 강희진 on 2023/11/21.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var userPosts: [GetUserPosts]?{
        didSet{
            // 데이터의 값이 변경되었을 때 다시 cell을 만든다.
            self.profileCollectionView.reloadData()
        }
    }
    
    var deletedIndex: Int?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupData()
    }
    
    // MARK: - Actions
    @objc
    func didLongPress(gestureRecognizer: UILongPressGestureRecognizer){
        // 셀을 오래 누르면 그 위치를 가져오게 하는 코드
        if gestureRecognizer.state != .began { return }
        
        let position = gestureRecognizer.location(in: profileCollectionView)
        
        if let indexPath = profileCollectionView?.indexPathForItem(at: position){
            print("DEBUG", indexPath.item)
            
            guard let userPosts = self.userPosts else { return }
            let cellData = userPosts[indexPath.item]
            self.deletedIndex = indexPath.item
            if let postIdx = cellData.postIdx{
                //삭제 API 호출
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
        }
    }
    
    
    // MARK: - Helpers
    private func setupCollectionView(){
        // delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        // Collection View에 Cell 등록
        profileCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        profileCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(gestureRecognizer: )))
        gesture.minimumPressDuration = 0.66
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        // action 메소드를 collectionView에 등록
        profileCollectionView.addGestureRecognizer(gesture)
    }
    private func setupData(){
        UserFeedDataManager().getUserFeed(self)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    //섹션의 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 내 정보 섹션 + 내 Post 섹션
        return 2
    }
    
    
    // Cell의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0: // section 0
            return 1
        default: // section 1
            return userPosts?.count ?? 0
        }
    }
    
    // Cell 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        
        switch section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패")
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else{
                fatalError("셀 타입 캐스팅 실패")
            }
            
            let itemIndex = indexPath.item
            if let cellData = self.userPosts{
                //데이터가 있는 경우, cell 데이터를 전달
                cell.setupData(cellData[itemIndex].postImgUrl)
            }
            return cell
        }
    }
}
// CollectionView는 TableVeiw와 다르게 Delegate를 하나 더 채택해야 한다.
extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        switch section{
        case 0:// profile
            return CGSize(width: collectionView.frame.width, height: CGFloat(159))
        default:// post
            let side = CGFloat((collectionView.frame.width / 3) - (4/3))
            return CGSize(width: side, height: side)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section{
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}

// MARK: - API 통신 메소드
extension ProfileViewController{
    func successFeedAPI(_ result: UserFeedModel){
        
        self.userPosts = result.result?.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool) {
        guard isSuccess else { return }
        
        if let deletedIndex = self.deletedIndex{
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}
