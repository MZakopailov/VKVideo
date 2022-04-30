//
//  SplashView.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel = SplashViewModel()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Spacer()
            Text("Splash Screen. \nI will make animation for this screen")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        appState.state = appState.token != "" ? .Main : .Login
                    }
                }
            Spacer()
            ProgressView()
                .tint(.red)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
