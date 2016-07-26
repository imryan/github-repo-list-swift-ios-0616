//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories: [GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        
        GithubAPIClient.getRepositoriesWithCompletion { (dictionary) in
            self.repositories = []
            
            for dict in dictionary {
                let repo = GithubRepository.init(dictionary: dict)
                self.repositories.append(repo)
            }
            
            if self.repositories.count > 0 {
                completion()
            }
        }
    }
}
