//
//  MainViewModel.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var videos:[Video] = [Video]()
    
    private let dataFetcher = DataFetcerService()
    
    func fetchVideoBy(query q: String) {
        dataFetcher.fetchVideos(q) { response in
            guard let videos = response?.response.items else { return }
            self.videos = videos
        }
    }
}
