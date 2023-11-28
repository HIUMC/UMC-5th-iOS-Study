//
//  PostCollectionViewCell.swift
//  CatStargram
//
//  Created by 강희진 on 2023/11/28.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    static let identifier = "PostCollectionViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData(){
        // 이미지뷰의 이미지를 업로드한다.
    }
}
