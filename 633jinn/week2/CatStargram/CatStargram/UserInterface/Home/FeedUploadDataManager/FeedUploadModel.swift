//
//  FeedUploadModel.swift
//  CatStargram
//
//  Created by 강희진 on 2023/12/15.
//

struct FeedUploadModel : Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: FeedUploadResult
}

struct FeedUploadResult: Decodable{
    var postIdx: Int?
}
