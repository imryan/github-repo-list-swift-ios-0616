//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completion: ([NSDictionary]) -> Void) {
        let url = NSURL(string:"https://api.github.com/repositories?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)")
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        session.dataTaskWithURL(url!, completionHandler: { (data, response, error) in
            if let data = data {
                do {
                    let result = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [NSDictionary]
                    completion(result)
                    
                } catch {
                    print("Error fetching repos.")
                }
            }
            
        }).resume()
    }
}