//
//  PlayerView.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 07.05.2022.
//

import SwiftUI

struct PlayerView: View {
    
    private var url: URL
    
    init(_ url: URL) {
        self.url = url
    }
    
    var body: some View {
        NavigationView {
            PlayerWebView(url: self.url)
                .navigationTitle("Player")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            self.rotate()
        }
    }
    
    func rotate() {
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(URL(string: "https://google.com")!)
    }
}
