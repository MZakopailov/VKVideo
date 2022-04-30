//
//  AuthView.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel = AuthViewModel()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Button("VK Login") {
            viewModel.loginVK()
        }
        .font(Font(.init(.system, size: 26.0)))
        .onReceive(viewModel.$isLoggedSuccess, perform: { newValue in
            if newValue {
                self.appState.state = .Main
            }
        })
    }
    
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
