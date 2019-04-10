//
//  RepositoryCellTests.swift
//  Github TaskUITests
//
//  Created by Omega on 4/10/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import XCTest
@testable import GithubRepoTask
class RepositoryCellTests: XCTestCase {
    var cell:RepositoryCell!
    var tableView: UITableView!
    let dataSource = FakeDataSource()
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "repoVC") as? RepositoryDisplayerViewController
        controller?.loadViewIfNeeded()
        tableView = controller?.tableView
        tableView.dataSource = dataSource
        cell = tableView.dequeueReusableCell(withIdentifier: "repoCell") as! RepositoryCell
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
        func test_HasRepoNameLabel()  {
             XCTAssertTrue(cell.repoNameLabel.isDescendant(of: cell.contentView))
             XCTAssertNotNil(cell.repoNameLabel)
        }
    //
        func test_HasDescriptLabel()  {
            XCTAssertTrue(cell.repoDescriptionLabel.isDescendant(of: cell.contentView))
            XCTAssertNotNil(cell.repoDescriptionLabel)
        }
    //
        func test_HasStarLabel()  {
            XCTAssertTrue(cell.numberOfStarsLabel.isDescendant(of: cell.contentView))
            XCTAssertNotNil(cell.numberOfStarsLabel)
        }
    //
        func test_HasImageView()  {
            XCTAssertTrue(cell.userAvatarImg.isDescendant(of: cell.contentView))
            XCTAssertNotNil(cell.userAvatarImg)
        }
    //
        func test_HasAvatarNameLabel()  {
            XCTAssertTrue(cell.usernameAndAvatarOwner.isDescendant(of: cell.contentView))
            XCTAssertNotNil(cell.usernameAndAvatarOwner)
        }
    
    func test_ConfigCell_setRepoName()  {
        cell.repoNameLabel.text = "Foo"
        XCTAssertEqual(cell.repoNameLabel.text, "Foo")
    }
    
    func test_ConfigCell_setRepoDescriptText()  {
        cell.repoDescriptionLabel.text = "Descript"
        XCTAssertEqual(cell.repoDescriptionLabel.text, "Descript")
    }
    
    func test_ConfigCell_SetStarText()  {
        cell.numberOfStarsLabel.text = "Stars"
        XCTAssertEqual(cell.numberOfStarsLabel.text, "Stars")
    }
    
    func test_ConfigCell_SetImage()  {
        cell.userAvatarImg.image = UIImage(named: "star")
        XCTAssertEqual(cell.userAvatarImg.image, UIImage(named: "star"))
    }
    
    func test_SetAvatarName()  {
        cell.usernameAndAvatarOwner.text = "Avatar"
        XCTAssertEqual(cell.usernameAndAvatarOwner.text, "Avatar")
    }
   

}


extension RepositoryCellTests {
    class FakeDataSource: NSObject,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
