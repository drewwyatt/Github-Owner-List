//
//  RemoteImageView.swift
//  Github Owner List
//
//  Created by Drew Wyatt on 11/27/19.
//  Copyright © 2019 Drew Wyatt. All rights reserved.
//

import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var viewModel: RemoteImageViewModel
    
    init(url: URL) {
        viewModel = RemoteImageViewModel(url: url)
    }
    
    var body: some View {
        viewForState.onAppear(perform: viewModel.fetchImage)
    }
    
    private var viewForState: some View {
        switch viewModel.state {
        case .loaded(let img):
            return AnyView(Image(uiImage: img).resizable())
        case .idle, .loading:
            return AnyView(LoadingView())
        case .error:
            return AnyView(Text("error"))
        }
        
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView(url: URL(string: "https://placekitten.com/200/300")!)
    }
}
