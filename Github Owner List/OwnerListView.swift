//
//  OwnerListView.swift
//  Github Owner List
//
//  Created by Drew Wyatt on 11/28/19.
//  Copyright © 2019 Drew Wyatt. All rights reserved.
//

import SwiftUI

struct OwnerListView: View {
    @ObservedObject var viewModel: OwnerListViewModel
    
    init() {
        viewModel = OwnerListViewModel()
    }
    
    var body: some View {
        viewForState.onAppear(perform: viewModel.fetchOwners)
    }
    
    private var viewForState: some View {
        switch (viewModel.state) {
        case .idle:
            return AnyView(Text("idle"))
        case .loading:
            return AnyView(LoadingView())
        case .loaded(let owners):
            return AnyView(List(owners, rowContent: OwnerItemView.init))
        case .error:
            return AnyView(Text("error"))
        }
    }
}

struct OwnerItemView: View {
    var owner: Owner
    
    var body: some View {
        HStack {
            RemoteImageView(url: owner.avatar_url)
            Text(owner.login)
        }
    }
}

struct OwnerListView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerListView()
    }
}
