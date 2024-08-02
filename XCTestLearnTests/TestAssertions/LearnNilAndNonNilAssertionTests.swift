//
//  LearnNilAndNonNilAssertionTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 02/08/24.
//

import XCTest

// https://developer.apple.com/documentation/xctest/nil_and_non-nil_assertions

final class LearnNilAndNonNilAssertionTests: XCTestCase {

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

    // https://developer.apple.com/documentation/xctest/1500523-xctassertnil
    func testNilAssertion() throws {
        let a: Int? = 0

        XCTAssertNil(a)
    }

    func testNonNilAssertion() throws {
        let a: Int? = nil
        let b: Int? = 0

        // https://developer.apple.com/documentation/xctest/1500453-xctassertnotnil
        XCTAssertNotNil(a)

        // https://developer.apple.com/documentation/xctest/3380195-xctunwrap
        // Generates error if b is nil, return an unwrapped value of b is not nil.
        let value = try XCTUnwrap(b)
        print(value)
    }
}
