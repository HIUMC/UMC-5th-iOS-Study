//
//  StoryCollectionViewCell.swift
//  CatStaGram
//
//  Created by 오연서 on 11/5/23.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var viewUserProfileBackground: UIView!
    @IBOutlet weak var viewImageViewBackground: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true //사진 자르려고
    }

}
