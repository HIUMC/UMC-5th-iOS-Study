//
//  FeedUploadDataManager.swift
//  CatStargram
//
//  Created by 강희진 on 2023/12/15.
//

import Alamofire

class FeedUploadDataManager {
    func posts(_ viewController: HomeViewController, _ parameter: FeedUploadInput){
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeedUploadModel.self){
            response in
            switch response.result{
            case .success(let result):
                if result.isSuccess{
                    print("성공")
                }
                else{ // post를 실패했을 때
                    print(result.message)
                }
                
            case .failure(let error): // 서버 자체와의 연동이 끝났을 때
                print(error.localizedDescription)
                
            }
        }
    }
}
