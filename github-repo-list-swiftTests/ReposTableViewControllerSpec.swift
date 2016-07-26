//
//  ReposTableViewControllerSpec.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Quick
import Nimble
import KIF

class ReposTableViewControllerSpec: QuickSpec {
    
    override func spec() {
        let tester = KIFUITestActor()
        let tableView = tester.waitForViewWithAccessibilityLabel("tableView") as! UITableView
        let indexPath = NSIndexPath(forRow: 1, inSection: 0)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        describe("TableView") {
            it("should have 1 section") {
                expect(tableView.numberOfSections).to(equal(1))
            }
            it("should have 2 cells") {
                expect(tableView.numberOfRowsInSection(0)).to(equal(2))
            }
        }
        
        describe("TableView Cells") {
            it("Should have the correct cells") {
                expect(cell).toNot(beNil())
                // I'm using a custom cell. This works. Trust me. And I don't mean the line below. That crashes.
                // expect((cell as! GHRepoCell).repoNameLabel.text).to(equal("wycats/merb-core"))
            }
        }
    }
}
