//
//  VideoPlayerView.swift
//  CatStargram
//
//  Created by 강희진 on 2023/12/18.
//

import UIKit
import AVKit

class VideoPlayerView: UIView{
    var playerLayer: AVPlayerLayer?
    var playerLooper: AVPlayerLooper?
    var querePlayer: AVQueuePlayer?
    var urlStr: String
    
    init(frame: CGRect, urlStr: String) {
        self.urlStr = urlStr
        super.init(frame: frame)
        
        let videoFileURL = Bundle.main.url(forResource: urlStr, withExtension: "mp4")!
        let playItem = AVPlayerItem(url: videoFileURL)
        
        self.querePlayer = AVQueuePlayer(playerItem: playItem)
        playerLayer = AVPlayerLayer()
        
        playerLayer?.player = querePlayer
        playerLayer?.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer!)
        
        playerLooper = AVPlayerLooper(player: querePlayer!, templateItem: playItem)
        querePlayer!.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func cleanUp(){
        querePlayer?.pause()
        querePlayer?.removeAllItems()
        querePlayer = nil
    }
    override func layoutSubviews(){
        super.layoutSubviews()
        playerLayer!.frame = bounds
    }
}
