//
//  LearnXCTNSPredicateExpectation.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 10/09/24.
//

import XCTest

final class LearnXCTNSPredicateExpectation: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    // https://developer.apple.com/documentation/xctest/xctnspredicateexpectation

    func testCreation() {
        let predicate = NSPredicate()

        // https://developer.apple.com/documentation/xctest/xctnspredicateexpectation/2806838-init
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: nil)
    }

    func testProperties() {
        let predicate = NSPredicate()
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: nil)

        // https://developer.apple.com/documentation/xctest/xctnspredicateexpectation/2806835-predicate
        print(expectation.predicate)

        // https://developer.apple.com/documentation/xctest/xctnspredicateexpectation/2806834-object
        print(expectation.object)
    }

    func testHandler() {
        let predicate = NSPredicate()
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: nil)

        // https://developer.apple.com/documentation/xctest/xctnspredicateexpectation/2806837-handler
        // https://developer.apple.com/documentation/xctest/xctnspredicateexpectation/handler
        expectation.handler = {
            return true
        }
    }
}
