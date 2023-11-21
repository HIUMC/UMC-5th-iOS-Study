//
//  FeedTableViewCell.swift
//  CatStaGram
//
//  Created by 오연서 on 10/30/23.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    @IBOutlet weak var buttonisHeart: UIButton!
    @IBOutlet weak var buttonIsBookMark: UIButton!
    @IBOutlet weak var labelHowManyLike: UILabel!
    @IBOutlet weak var labelFeed: UILabel!
    
    @IBAction func actionIsHeart(_ sender: Any) {
        if buttonisHeart.isSelected {
            buttonisHeart.isSelected = false
        } else{
            buttonisHeart.isSelected = true
        }
    }
    @IBAction func actionIsBookMark(_ sender: Any) {
        if buttonIsBookMark.isSelected {
            buttonIsBookMark.isSelected = false
        } else{
            buttonIsBookMark.isSelected = true
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewUserProfile.layer.cornerRadius = 12.5
        imageViewUserProfile.clipsToBounds = true //동그라미할때 이미지 같이 잘림
        imageViewMyProfile.layer.cornerRadius = 12.5
        imageViewMyProfile.clipsToBounds = true //동그라미할때 이미지 같이 잘림
        
        //한 줄에 -> [사용자이름(semibold) + 내용(default)] 구현하기
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 3))
        
        labelFeed.attributedText = attributedStr

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
