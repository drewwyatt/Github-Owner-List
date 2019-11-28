//
//  OwnerListViewModel.swift
//  Github Owner List
//
//  Created by Drew Wyatt on 11/28/19.
//  Copyright © 2019 Drew Wyatt. All rights reserved.
//

import UIKit

struct Owner : Decodable, Identifiable {
    let id: Int
    let login: String
    let avatar_url: URL
}

struct GHOrg : Decodable {
    let id: Int
    let owner: Owner
}

class OwnerListViewModel : ObservableObject {
    private let url: URL = URL(string: "https://api.github.com/orgs/octokit/repos")!
    enum State {
        case idle
        case loading
        case loaded([Owner])
        case error
    }
    
    @Published var state: State = .idle
    
    func fetchOwners() {
        state = .loading
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                self?.state =  data.flatMap { d in
                    try! decoder.decode([GHOrg].self, from: d) }.map { orgs in
                        orgs.map { org in
                            org.owner
                        }
                    }.map(State.loaded) ?? .error
    
            }
        }.resume()
    }
}
