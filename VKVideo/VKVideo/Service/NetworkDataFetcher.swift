//
//  NetworkDataFetcher.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 04.05.2022.
//

import Foundation

protocol DataFetcher {
    func fetchAuthJSONData<T: Decodable>(urlString: String, response: @escaping(T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    var network: Networking
    
    init(_ networkService: Networking = NetworkService()) {
        self.network = networkService
    }
    
    func fetchAuthJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        guard let authToken = getAccessToken() else { return }
        let authUrlString = urlString + "&access_token=\(authToken)" + "&v=5.131"
        self.network.requrest(urlString: authUrlString) { data, error in
            if let error = error {
                print("Error recived request data: \(error)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Faild to decode JSON", jsonError)
            return nil
        }
    }
    
    private func getAccessToken() -> String? {
        return UserDefaults.standard.value(forKey: AppStorageProperties.Token) as? String
    }
}
