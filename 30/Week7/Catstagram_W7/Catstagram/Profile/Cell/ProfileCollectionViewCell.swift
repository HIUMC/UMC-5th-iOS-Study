//
//  ProfileCollectionViewCell.swift
//  Catstagram_W7
//
//  Created by Seyoung on 11/13/23.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"
    
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    @IBOutlet weak var addFriendButon: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    
    @IBOutlet weak var followerCountLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
        // Initialization code
    }
    
    
    private func setupAttribute() {
        profileImageView.layer.cornerRadius = 44
        addProfileImageView.layer.cornerRadius = 12
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButon.layer.cornerRadius = 3
        addFriendButon.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButon.layer.borderWidth = 1
        
        [postingCountLabel, followerCountLabel, followingCountLabel]
            .forEach { $0.text = "\(Int.random(in: 0...10))"}
    }
        

}
