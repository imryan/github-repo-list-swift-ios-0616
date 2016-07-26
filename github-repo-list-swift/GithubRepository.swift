//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var repositoryID: Int
    var fullName: String
    var htmlURL: NSURL
    
    init(dictionary: NSDictionary) {
        self.repositoryID = dictionary["id"] as! Int
        self.fullName = dictionary["full_name"] as! String
        self.htmlURL = NSURL(string: dictionary["html_url"] as! String)!
    }
}
