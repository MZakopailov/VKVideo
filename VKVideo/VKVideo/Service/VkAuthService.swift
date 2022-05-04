//
//  VkAuthService.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import AuthenticationServices

class VkAuthService: NSObject, ASWebAuthenticationPresentationContextProviding {
    
    private let vkAppId = "8153714"
    private let vkCredentional = ["video", "offline"]
    private let scheme = "vk8153714"
    private var callback: (String?, Error?) -> Void
    
    init(_ result: @escaping (String?, Error?) -> Void) {
        self.callback = result
    }
    
    private func builURL() -> URL {
        var components = URLComponents()
            components.scheme = "https"
            components.host = "oauth.vk.com"
            components.path = "/oauth/authorize"
            components.queryItems = [
                URLQueryItem(name: "client_id", value: vkAppId),
                URLQueryItem(name: "display", value: "page"),
                URLQueryItem(name: "redirect_uri", value: "\(scheme)://authorize"),
                URLQueryItem(name: "scope", value: vkCredentional.joined(separator: ",")),
                URLQueryItem(name: "response_type", value: "token"),
                URLQueryItem(name: "v", value: "5.131")
            ]

        guard let url = components.url else { fatalError() }
        return url
    }
    
    func login() {
        let urlRequest = builURL()
        let authenticationSession = ASWebAuthenticationSession(url: urlRequest, callbackURLScheme: scheme) { callbackURL, error in
            guard error == nil, let url = callbackURL else {
                print("An error occurred when attempting to sign in.")
                return
            }
            self.processResponseURL(url: url)
        }
        authenticationSession.presentationContextProvider = self
        authenticationSession.prefersEphemeralWebBrowserSession = true
        authenticationSession.start()
    }
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
    
}

extension VkAuthService {
    
    private func processResponseURL(url: URL) {
        let uniformURlString = url.absoluteString.replacingOccurrences(of: "#", with: "?")
        let queryItems = URLComponents(string: uniformURlString)?.queryItems
        let token = queryItems?.first(where: {$0.name == "access_token"})?.value
        callback(token, nil)
    }
}
