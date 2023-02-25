//
//  Number.swift
//  TDD Directory appTests
//
//  Created by mac on 1/3/23.
//

import XCTest
@testable import TDD_Directory_app

final class Number: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_IsEvenReturned() {
        let array = NumberContoller.evenNumebers(arr: [1,2,3,4,5])
        XCTAssert(array.contains([2,4]))
        
//        XCTAssert(!array.contains([29,31,33]))
//        XCTAssert(array.contains([24,26,28,30]))
    
        
    }
    func test_IsOtherReturnedNegative() {
        let array = NumberContoller.evenNumebers(arr: [-1,-2,-3,-4,-5])
        XCTAssert(array.contains([-2,-4]))
    }
    func test_HighEndNums() {
        let array = NumberContoller.evenNumebers(arr: [1000,1001,1002,1003,1004])
        XCTAssert(array.contains([1000,1002,1004]))
    }
    
    func test_IsRandomReturned() {
        let arr = NumberContoller.evenNumebers(arr: [1,100,24,74,56,87])
        XCTAssert(arr.contains([100,24,74,56]))
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
