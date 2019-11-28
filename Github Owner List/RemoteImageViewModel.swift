//
//  RemoteImageViewModel.swift
//  Github Owner List
//
//  Created by Drew Wyatt on 11/27/19.
//  Copyright © 2019 Drew Wyatt. All rights reserved.
//

import UIKit

class RemoteImageViewModel : ObservableObject {
    enum State {
        case idle
        case loading
        case loaded(UIImage)
        case error
    }
    
    @Published var state: State = .idle
    private let url: URL;
    private var hasFetched: Bool = false
    
    init(url: URL) {
        self.url = url
    }
    
    func fetchImage() {
        if (!hasFetched) {
            hasFetched = true
            state = .loading
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                DispatchQueue.main.async {
                    self?.state = data
                        .flatMap(UIImage.init)
                        .map(State.loaded) ?? .error
                }
            }.resume()
        }
    }
}
