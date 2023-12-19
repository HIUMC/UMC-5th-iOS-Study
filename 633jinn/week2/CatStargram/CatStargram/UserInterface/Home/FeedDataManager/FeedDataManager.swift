//
//  FeedDataManager.swift
//  CatStargram
//
//  Created by 강희진 on 2023/11/28.
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ viewController: HomeViewController, _ parameters: FeedAPIInput){
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result{
            case .success(let result):
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
