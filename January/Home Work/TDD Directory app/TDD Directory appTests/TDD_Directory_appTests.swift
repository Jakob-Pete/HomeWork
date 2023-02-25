//
//  TDD_Directory_appTests.swift
//  TDD Directory appTests
//
//  Created by mac on 1/3/23.
//

import XCTest
@testable import TDD_Directory_app

final class TDD_Directory_appTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_PersonInit() {
        let person = Person(name: "John", age: 21)
        XCTAssert(person.name == "John")
        XCTAssert(person.age == 21)
        XCTAssertNil(person.height)
        XCTAssertNil(person.weight)
        
    }
    func test_PersonInit_Other() {
        let person = Person(name: "Mack", age: 32, height: 65, weight: 140)
        XCTAssert(person.name == "Mack")
        XCTAssert(person.age != 34)
        XCTAssert(person.height == 65)
        XCTAssert(person.weight == 140)
        
    }
    
    func test_PersonInit_Updated() {
        var person = Person(name: "Fred", age: 85)
        person.name = "Geo"
        XCTAssert(person.name == "Geo")
        
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
