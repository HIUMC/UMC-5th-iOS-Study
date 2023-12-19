//
//  DeleteUserFeed.swift
//  CatStargram
//
//  Created by 강희진 on 2023/12/18.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
