//
//  LearnXCTTestSuitesTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 12/11/24.
//

import XCTest

final class LearnXCTTestSuitesTests: XCTestCase {

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

    // https://developer.apple.com/documentation/xctest/xctestsuite

    func testCratingTestSuites() throws {
        // https://developer.apple.com/documentation/xctest/xctestsuite/1500584-default
        print(XCTestSuite.default.description)

        // https://developer.apple.com/documentation/xctest/xctestsuite/1500579-init
        let testSuite1 = XCTestSuite(name: "My_Suite")

        // https://developer.apple.com/documentation/xctest/xctestsuite/1500684-init
        let testSuite2 = XCTestSuite(forBundlePath: "")

        // https://developer.apple.com/documentation/xctest/xctestsuite/1500818-init
        let testSuite3 = XCTestSuite(forTestCaseClass: MyTestClass.self)
        print(testSuite3.tests[0].name)

        // https://developer.apple.com/documentation/xctest/xctestsuite/1500897-init
        let testSuite4 = XCTestSuite(forTestCaseWithName: "-[_TtCC18XCTestLearnUITests23LearnXCTTestSuitesTests11MyTestClass testMyName]")


        print("")
    }

    func testManagingTests() throws {
        let testSuite = XCTestSuite(name: "My_Suite")

        // https://developer.apple.com/documentation/xctest/xctestsuite/1500357-addtest
        testSuite.addTest(MyTestClass())

        // https://developer.apple.com/documentation/xctest/xctestsuite/1500631-tests
        print(testSuite.tests)
    }

    class MyTestClass: XCTestCase {
        func testMyName() {

        }
    }

}
