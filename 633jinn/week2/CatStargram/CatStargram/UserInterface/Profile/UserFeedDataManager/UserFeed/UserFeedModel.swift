//
//  UserFeedModel.swift
//  CatStargram
//
//  Created by 강희진 on 2023/12/15.
//

import Foundation

struct UserFeedModel: Decodable{
    
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: UserFeedModelResult?
    
    }

struct GetUserInfo: Decodable{
    
    let userIdx: Int?
    let nickName: String?
    let name: String?
    let profileImgrl: String?
    let website: String?
    let introduction: String?
    let followerCount: Int?
    let followeeCount: Int?
    let postCount: Int?
    
}
struct GetUserPosts: Decodable{
    let postIdx: Int?
    let postImgUrl: String?
}
struct UserFeedModelResult: Decodable{
    
    let _isMyFeed: Bool?
    let getUserInfo: GetUserInfo?
    let getUserPosts: [GetUserPosts]?
}
