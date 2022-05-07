//
//  MainViewModel.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var videos:[Video] = [Video]()
    @Published var isLoading = false
    
    private let dataFetcher = DataFetcerService()
    
    private func normalizeResponse(_ response: BaseResponse?) {
        isLoading = false
        guard let videos = response?.response.items else { return }
        self.videos = videos
    }
    
    func fetchVideos() {
        isLoading = true
        dataFetcher.fetchOwnVideos({ self.normalizeResponse($0) })
    }
    
    func fetchVideoBy(query q: String) {
        isLoading = true
        dataFetcher.searchVideos(q, completion: { self.normalizeResponse($0) })
    }
}
