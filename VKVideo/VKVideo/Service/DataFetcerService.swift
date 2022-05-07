//
//  DataFetcerService.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 04.05.2022.
//

import Foundation

class DataFetcerService {
    
    var networkDataFetcher: DataFetcher
    
    private let baseURL = "https://api.vk.com/method/"
    
    init(_ dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = dataFetcher
    }
    
    func fetchOwnVideos(_ completion: @escaping(BaseResponse?)-> Void) {
        let userID = User.getUserId()
        let urlRequest = baseURL + "video.get?owner_id=\(userID)"
        self.networkDataFetcher.fetchAuthJSONData(urlString: urlRequest, response: completion)
    }
    
    func searchVideos(_ q: String, completion: @escaping(BaseResponse?) -> Void) {
        let urlVideo = "https://api.vk.com/method/video.search?q=\(q)&filters=mp4"
        self.networkDataFetcher.fetchAuthJSONData(urlString: urlVideo, response: completion)
    }
    
    func getProfileInfo(_ completion: @escaping(ProfileBaseResponse?) -> Void) {
        let urlRequest = "https://api.vk.com/method/users.get?name_case=nom"
        self.networkDataFetcher.fetchAuthJSONData(urlString: urlRequest, response: completion)
    }
    
}
