//
//  XCTestLearn.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 01/08/24.
//

import XCTest

final class XCTestLearn: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testXCTestBaseClass() throws {
        // https://developer.apple.com/documentation/xctest/xctest/1500990-name
        print("XCTest.name \(self.name)")

        // https://developer.apple.com/documentation/xctest/xctest/1500545-testcasecount
        print("XCTest.testCasecount \(self.testCaseCount)")

        // https://developer.apple.com/documentation/xctest/xctest/1500629-testrun
        // The test run object that executes the test.
        print("XCTest.testRun \(self.testRun)")

        // https://developer.apple.com/documentation/xctest/xctest/1500950-testrunclass
        // The test run subclass to instantiate when the test runs, which records the test’s results.
        print("XCTest.testRunClass \(self.testRunClass)")
    }

    func testMySecondTests() throws {
        // perform() & run()
        // https://developer.apple.com/documentation/xctest/xctest/1500817-perform
        // https://developer.apple.com/documentation/xctest/xctest/1501010-run
    }
}
