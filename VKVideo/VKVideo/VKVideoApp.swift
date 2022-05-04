//
//  VKVideoApp.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import SwiftUI

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
            case  .Main: MainView()
            }
            
        }
    }
}
