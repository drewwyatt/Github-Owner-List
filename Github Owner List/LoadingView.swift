//
//  LoadingView.swift
//  Github Owner List
//
//  Created by Drew Wyatt on 11/28/19.
//  Copyright © 2019 Drew Wyatt. All rights reserved.
//

import UIKit
import SwiftUI

struct LoadingView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<LoadingView>) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingView>) {
        // ...
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
