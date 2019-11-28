//
//  RemoteImageViewModel.swift
//  Github Owner List
//
//  Created by Drew Wyatt on 11/27/19.
//  Copyright © 2019 Drew Wyatt. All rights reserved.
//

import Combine
import UIKit

class RemoteImageViewModel : ObservableObject {
    enum State {
        case idle
        case loading
        case loaded(UIImage)
    }
    
    @Published var state: State = .idle
    private let url: URL;
    
    init(url: URL) {
        self.url = url
    }
    
    func fetchImage() {
        state = .loading
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.state = data
                    .flatMap(UIImage.init)
                    .map(State.loaded) ?? .idle
            }
        }.resume()
    }
}
