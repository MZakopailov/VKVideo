//
//  VKVideoApp.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import SwiftUI
import vk_ios_sdk

@main
struct VKVideoApp: App {
    @ObservedObject var appState = AppState(state: .Splash)
    
    var body: some Scene {
        WindowGroup {
            switch appState.state {
            case .Splash: SplashView()
                    .environmentObject(appState)
            case .Login: AuthView()
                    .environmentObject(appState)
                    .onOpenURL { url in
                        VKSdk.processOpen(url, fromApplication: nil)
                    }
            case  .Main: MainView()
            }
            
        }
    }
}
