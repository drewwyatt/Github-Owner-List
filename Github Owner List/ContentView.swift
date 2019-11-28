//
//  ContentView.swift
//  Github Owner List
//
//  Created by Drew Wyatt on 11/27/19.
//  Copyright © 2019 Drew Wyatt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        RemoteImageView(url: URL(string: "https://placekitten.com/200/300")!)
        OwnerListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
