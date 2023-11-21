//
//  ProfileViewController.swift
//  CatStaGram
//
//  Created by WooHyun on 2023/11/09.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilecollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
 
    
    private func setupCollectionView() {
        profilecollectionView.delegate = self
        profilecollectionView.dataSource = self
        
        profilecollectionView.register(
            UINib(
                nibName: "ProfileCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
            fatalError("셀 타입 캐스팅 실패")
        }
        
        return cell
    }
}

extension ProfileViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexpath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(159))
    }
}
