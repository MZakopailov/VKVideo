//
//  AppState.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import SwiftUI

enum AppStates {
    case Splash
    case Login
    case Main
}

struct AppStorageProperties {
    static let Token = "VKToken"
}

class AppState: ObservableObject {
    @Published var state: AppStates
    @AppStorage(AppStorageProperties.Token) var token: String = "" {
        didSet {
            if !token.isEmpty {
                state = .Main
            }
        }
    }
    
    init(state: AppStates) {
        self.state = state
    }
}
