//
//  DataFetcerService.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 04.05.2022.
//

import Foundation

class DataFetcerService {
    
    var networkDataFetcher: DataFetcher
    
    init(_ dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = dataFetcher
    }
    
    func fetchVideos(_ q: String, completion: @escaping(BaseResponse?) -> Void) {
        let urlVideo = "https://api.vk.com/method/video.search?q=\(q)"
        self.networkDataFetcher.fetchAuthJSONData(urlString: urlVideo, response: completion)
    }
    
}
