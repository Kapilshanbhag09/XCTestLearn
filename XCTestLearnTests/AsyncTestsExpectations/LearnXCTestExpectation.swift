//
//  LearnXCTestExpectation.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 19/08/24.
//

import XCTest

final class LearnXCTestExpectation: XCTestCase {

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

    func testXCTestExpectation() throws {

        // https://developer.apple.com/documentation/xctest/xctestexpectation/2806571-init
        let expectation = XCTestExpectation(description: "My Expectation for testing")

        // https://developer.apple.com/documentation/xctest/xctestexpectation/2806576-expectationdescription
        expectation.expectationDescription = "Changed expecation description."
        print(expectation.expectationDescription)

        // https://developer.apple.com/documentation/xctest/xctestexpectation/1501027-fulfill
        expectation.fulfill()

        // https://developer.apple.com/documentation/xctest/xctestexpectation/2806572-expectedfulfillmentcount
        // Can change the expectedFulfillmentCount if we want our expectation to be fulfilled more than 1.
        print(expectation.expectedFulfillmentCount)

        // https://developer.apple.com/documentation/xctest/xctestexpectation/2806575-assertforoverfulfill
        print(expectation.assertForOverFulfill)

        // https://developer.apple.com/documentation/xctest/xctestexpectation/2806573-isinverted
        print(expectation.isInverted)
        expectation.isInverted = true

        expectation.fulfill()
    }
}
