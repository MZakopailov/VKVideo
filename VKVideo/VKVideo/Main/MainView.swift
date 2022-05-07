//
//  MainView.swift
//  VKVideo
//
//  Created by Maxim Zakopaylov on 29.04.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.videos, id:\.id) { item in
                    HStack {
                        let imageURL = URL(string: item.image.first?.url ?? "")
                        AsyncImage(url: imageURL)
                            .fixedSize()
                        Text(item.title)
                        if let playerURL = URL(string: item.player ?? "") {
                            NavigationLink("\(item.title)") {
                                PlayerWebView(url: playerURL)
                            }
                        }

                    }
                }
            }
            .navigationTitle("Videos")
            .searchable(text: $searchText)
            .onChange(of: searchText) { newValue in
                self.viewModel.fetchVideoBy(query: newValue)
            }
        }
        .navigationViewStyle(.stack)
    }
}
