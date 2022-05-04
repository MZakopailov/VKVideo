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
                        Text(item.title)
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
