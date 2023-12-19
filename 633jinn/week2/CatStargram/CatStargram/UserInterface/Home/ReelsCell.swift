//
//  ReelsCell.swift
//  CatStargram
//
//  Created by 강희진 on 2023/12/18.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell: UICollectionViewCell{
    static let identifier = "ReelsCell"
    
    var videoView: VideoPlayerView?
    // 릴스
    var cellTitleLabel = UILabel()
    
    // 카메라
    let cameraImageView = UIImageView()
    
    // 댓글
    let commentImageView = UIImageView()
    
    // 좋아요
    let likeImageView = UIImageView()
    
    // 공유하기
    let shareImageView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .green
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupURL(_ urlStr: String){
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
        setupAttribute()
        setupLayout()
    }
    
    private func setupAttribute(){
        cellTitleLabel.text = "릴스"
        cellTitleLabel.font = .boldSystemFont(ofSize: 25)
        cellTitleLabel.textAlignment = .left
        cellTitleLabel.textColor = .white
        
        [cameraImageView, shareImageView, likeImageView, commentImageView]
            .forEach {
                $0.contentMode = .scaleAspectFit
                $0.tintColor = .white
            }
        
        cameraImageView.image = UIImage(systemName: "camera")
        shareImageView.image = UIImage(systemName: "paperplane")
        likeImageView.image = UIImage(systemName: "suit.heart")
        commentImageView.image = UIImage(systemName: "message")
    }
    
    private func setupLayout(){
        guard let videoView = videoView else { return }
        contentView.addSubview(videoView)
        
        videoView.snp.makeConstraints{make in make.edges.equalToSuperview()
        }
        
        [cellTitleLabel, cameraImageView,
        likeImageView,
        commentImageView,
        shareImageView]
            .forEach{contentView.addSubview($0)}
        
        cellTitleLabel.snp.makeConstraints{
            make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        cameraImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(35)
        }
        
        shareImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(35)
        }
        
        let space = CGFloat(20)
        
        commentImageView.snp.makeConstraints { make in
            make.bottom.equalTo(shareImageView.snp.top).offset(-space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
        
        likeImageView.snp.makeConstraints { make in
            make.bottom.equalTo(commentImageView.snp.top).offset(-space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
    }
}

