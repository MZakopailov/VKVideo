//
//  NetworkService.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 04.05.2022.
//

import Foundation

protocol Networking {
    func requrest(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {
    
    func requrest(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let requst = URLRequest(url: url)
        let task = createDataTask(from: requst, comletion: completion)
        task.resume()
    }
    
    
    private func createDataTask(from reques: URLRequest, comletion: @escaping(Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: reques) { data, response, error in
            DispatchQueue.main.async {
                comletion(data, error)
            }
        }
    }
}
