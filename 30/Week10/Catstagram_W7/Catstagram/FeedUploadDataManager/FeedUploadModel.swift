//
//  FeedUploadModel.swift
//  Catstagram_W7
//
//  Created by Seyoung on 12/19/23.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
