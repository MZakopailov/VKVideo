//
//  Video.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 04.05.2022.
//

import Foundation

struct BaseResponse: Decodable {
    let response: VideoResponse
}

struct VideoResponse: Decodable {
    let count: Int
    let items: [Video]
}

struct VideoImage: Decodable {
    let url: String
}

struct Video: Decodable, Identifiable {
    let id: Int
    let title: String
    let duration: Double
    let image: [VideoImage]
    let player: String?
}
