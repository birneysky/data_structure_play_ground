//
//  TreeNodeTests.swift
//  CollectionsTests
//
//  Created by birneysky on 2019/10/8.
//

import XCTest
import Solution

class TreeNodeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

     // MARK: - TreeNode
    func test_treenode_maxDepath() {
        ///        3
        ///       / \
        ///      9  20
        ///        /  \
        ///       15   7
        let root = TreeNode.createTree(with: [3,9,20,nil,nil,15,7], from: 0)
        let maxDepth = TreeNode.maxDepth(root)
        print(root!)
        XCTAssertEqual(maxDepth, 3)
    }
    func test_treenode_createTree() {
        let root1 = TreeNode.createTree(with: [3,9,20,nil,nil,15,7], from: 0)
        print(root1!)
        
        let root2 = TreeNode.createTree(with: [3,9,20,nil,nil,15,7,nil,nil,nil,nil,10,16,nil,18], from: 0)
        print(root2!)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
