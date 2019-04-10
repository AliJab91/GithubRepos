//
//  RepositoryVCTests.swift
//  Github TaskUITests
//
//  Created by Omega on 4/10/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import XCTest
@testable import GithubRepoTask
class RepositoryVCTests: XCTestCase {
    var controller:RepositoryDisplayerViewController!
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let viewController = storyboard.instantiateViewController(withIdentifier: "repoVC")
        controller = viewController as? RepositoryDisplayerViewController
        controller.loadViewIfNeeded()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_TableView_IsNotNil_AfterViewDidLoad()  {
        XCTAssertNotNil(controller.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(controller.tableView.dataSource is RepositoryDisplayerViewController)
    }
    
    func test_LoadingView_SetsTableViewDelegate()  {
        XCTAssertTrue(controller.tableView.delegate is RepositoryDisplayerViewController)
    }
    
    func test_ReloadTableView()  {
        controller.beginAppearanceTransition(true, animated: true)
        controller.endAppearanceTransition()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   

}
