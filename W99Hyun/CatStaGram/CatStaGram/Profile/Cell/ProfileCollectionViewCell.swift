//
//  ProfileCollectionViewCell.swift
//  CatStaGram
//
//  Created by WooHyun on 2023/11/09.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    static let identifier = "ProfileCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }

    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addFriendButton: UIButton!
    
    private func setupAttribute() {
        profileImageView.layer.cornerRadius = 88/2
        addProfileImageView.layer.cornerRadius = 24/2
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
    }
}
