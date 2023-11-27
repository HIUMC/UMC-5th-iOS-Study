//
//  ProfileViewController.swift
//  Catstagram_W7
//
//  Created by Seyoung on 11/13/23.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        
    }
    
    //MARK: - Actions
    
    //MARK: - Helpers
    private func setupCollectionView() {
        // delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        // cell 등록
        profileCollectionView.register(
            UINib(nibName: "ProfileCollectionViewCell",
                  bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
    }
}
    
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
}


extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            // CollectionView Frame의 높이와 같게 width를 맞춤
            width: collectionView.frame.width,
            height: CGFloat(159))
    }
}
