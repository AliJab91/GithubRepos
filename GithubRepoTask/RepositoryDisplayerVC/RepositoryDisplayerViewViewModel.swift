//
//  RepositoryDisplayerViewViewModel.swift
//  GithubRepoTask
//
//  Created by Ali Jaber on 4/10/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

final class RepositoryDisplayerViewViewModel {
    
    private var githubRepos = [GithubRepository]()
    
    var numberOfRowsInSection: Int {
        return githubRepos.count
    }
    
    func repository(for index: Int) -> GithubRepository {
        return githubRepos[index]
    }
    
    
    private (set) var page = 1 {
        // every time we increment the page number, fetchRepos() gets called
        didSet {
            fetchRepos()
        }
    }
    
    var isLoading: ((Bool) -> ())?
    var didFinishFetching: ((_ error: Error?) -> ())?
    
    func fetchRepos() {
        isLoading?(true)
        APIRequests.getRepositories(page:page, date: Date.finalDateForMonthAgo) { [weak self] (success, error, repositories) in
            guard let self = self else { return }
            self.isLoading?(false)
            if !success {
                self.didFinishFetching?(RequestError.description(error))
            } else {
                self.githubRepos.append(contentsOf: repositories)
                self.didFinishFetching?(nil)
            }
        }
    }
    
    func incrementPage() {
        page = page + 1
    }
    
}

// an error to be returned when a request fails
enum RequestError: Error {
    case description(String)
}
