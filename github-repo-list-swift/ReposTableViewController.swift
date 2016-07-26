//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    let store = ReposDataStore.sharedInstance
    var repositories: [GithubRepository] = []
    
    // MARK: - Functions
    
    func reload() {
        self.store.getRepositoriesWithCompletion({
            self.repositories = self.store.repositories
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            })
        })
    }
    
    // MARK: - Table
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Repositories"
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellId", forIndexPath: indexPath) as! GHRepoCell
        
        let repository = repositories[indexPath.row]
        cell.repoNameLabel.text = repository.fullName
        cell.repoLinkLabel.text = repository.htmlURL.absoluteString
        
        return cell
    }
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.accessibilityLabel = "tableView"
        
        self.refreshControl = UIRefreshControl(frame: self.tableView.frame)
        self.refreshControl!.addTarget(self, action: #selector(reload), forControlEvents: .ValueChanged)
        self.tableView.addSubview(self.refreshControl!)
        
        reload()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let webViewController = segue.destinationViewController as! RepoWebViewController
        
        if let index = tableView.indexPathForSelectedRow?.row {
            let repository = repositories[index]
            webViewController.repoURL = repository.htmlURL
            webViewController.navigationItem.title = repository.fullName
        }
        
    }
}
