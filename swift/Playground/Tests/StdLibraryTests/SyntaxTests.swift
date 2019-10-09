//
//  SyntaxTests.swift
//  CollectionsTests
//
//  Created by birneysky on 2019/10/9.
//

import XCTest

class SyntaxTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func ttt(_ aValue: Int?, _ bValue: Int?) -> Int? {
        guard let aVal = aValue,
              let bVal = bValue else {
                 return aValue ?? bValue
          }
        if aVal <= bVal {
            return aVal
        } else {
            return bVal
        }
    }
    
    func test_option_chanin() {
        print(ttt(3, nil))
        print(ttt(nil, 5))
        print(ttt(4, 5))
        print(ttt(nil, nil))
    }

    func test_if() {
        let a = 3;
        let val: Int? = 3
        if let aval =  val,
           aval >= a {
            XCTAssert(true)
        }
        
        let value: Int? = nil
        if let avalue = value,
            avalue > a {
            XCTAssert(false)
        } else {
            XCTAssert(true)
        }
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
