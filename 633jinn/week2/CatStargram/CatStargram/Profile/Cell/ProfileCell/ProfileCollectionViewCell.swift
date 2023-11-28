//
//  ProfileCollectionViewCell.swift
//  CatStargram
//
//  Created by 강희진 on 2023/11/21.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var postingCountLabel: UILabel!
    @IBOutlet weak var addFriendButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        //nib파일이 실행될 때, 아래 함수도 실행된다.
        setupAttribute()
    }
    private func setupAttribute(){
        profileImageView.layer.cornerRadius = 44
        addProfileImageView.layer.cornerRadius = 12
        
        // 프로필 편집에 테두리 추가
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        [postingCountLabel, followerCountLabel, followingCountLabel].forEach{ $0.text =  "\(Int.random(in: 0...10))"}
    }
}
