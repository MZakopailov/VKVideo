//
//  AuthViewModel.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var isLoggedSuccess: Bool = false
    
    private var vkAuthService: VkAuthService?
    
    func loginVK() {
        vkAuthService = VkAuthService({ [weak self] token, error in
            if let err = error {
                self?.isLoggedSuccess = false
                print(err.localizedDescription)
                return
            }
            guard let t = token else {
                self?.isLoggedSuccess = false
                return
            }
            
            self?.saveToken(t)
            self?.saveUserInfo()
        })
        vkAuthService?.login()
    }
    
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: AppStorageProperties.Token)
        self.isLoggedSuccess = true
    }
    
    func saveUserInfo() {
        let dataService = DataFetcerService()
        dataService.getProfileInfo { request in
            if let request = request {
                if let user = request.response.first {
                    UserDefaults.standard.set(user.id, forKey: AppStorageProperties.UserId)
                }
            }
        }
    }
}



