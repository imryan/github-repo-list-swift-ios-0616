//
//  RepoWebViewController.swift
//  github-repo-list-swift
//
//  Created by Ryan Cohen on 7/26/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class RepoWebViewController: UIViewController {
    
    var repoURL: NSURL?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        if let url = repoURL {
            let request = NSURLRequest(URL: url)
            
            webView.loadRequest(request)
        }
    }
}
