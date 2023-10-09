//
//  FeedTableTableViewCell.swift
//  catStaGram
//
//  Created by 반성준 on 2023/10/04.
//

import UIKit

class FeedTableTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageViewUserProfile: UIImageView!
    
    @IBOutlet weak var labelUserName: UILabel!
    
    @IBOutlet weak var ImageViewFeed: UIImageView!
    
    @IBOutlet weak var buttonIsHeart: UIButton!
    
    @IBOutlet weak var buttonIsBookMark: UIButton!
    
    @IBOutlet weak var labelHowMayLike: UILabel!
    
    @IBOutlet weak var labelFeed: UILabel!
    
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    
    
    //아래부터 버튼 액션
    @IBAction func actionIsHeart(_ sender: Any) {
        if buttonIsHeart.isSelected {
            buttonIsHeart.isSelected = false
        } else {
            buttonIsHeart.isSelected = true
        }
    }
    @IBAction func actionBookMark(_ sender: Any) {
        if buttonIsBookMark.isSelected {
            buttonIsBookMark.isSelected = false
        } else {
            buttonIsBookMark.isSelected = true
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ImageViewUserProfile.layer.cornerRadius = 22.5
        ImageViewUserProfile.clipsToBounds = true
        imageViewMyProfile.layer.cornerRadius = 22.5
        imageViewMyProfile.clipsToBounds = true
        
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 6))
        
        labelFeed.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
