//
//  FeedUploadModelDataManager.swift
//  Catstagram_W7
//
//  Created by Seyoung on 12/19/23.
//

import Alamofire

class FeedUploadModelDataManager {
    func posts(_ viewController : HomeViewController, _ parameter : FeedUploadInput) {
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeedUploadModel.self) {response in
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("success")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
