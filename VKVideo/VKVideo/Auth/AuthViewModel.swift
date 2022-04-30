//
//  AuthViewModel.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import SwiftUI
import vk_ios_sdk

class AuthViewModel: ObservableObject {
    
    @Published var isLoggedSuccess: Bool = false
    
    private var vkService: vkApiService?
    
    func loginVK() {
        vkService = vkApiService({ [weak self] token, error in
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
        })
        vkService?.login()
    }
    
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: AppStorageProperties.Token)
        self.isLoggedSuccess = true
    }
}


