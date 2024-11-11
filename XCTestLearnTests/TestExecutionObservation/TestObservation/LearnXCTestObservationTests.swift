//
//  LearnXCTestObservationTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 11/11/24.
//

import XCTest

final class LearnXCTestObservationTests: XCTestCase {
    
    static override func setUp() {
        let myObserver = MyTestObsever()
        XCTestObservationCenter.shared.addTestObserver(myObserver)
    }

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
    
    // https://developer.apple.com/documentation/xctest/xctestobservation
    class MyTestObsever: NSObject, XCTestObservation {
        // https://developer.apple.com/documentation/xctest/xctestobservation/1500772-testbundlewillstart
        func testBundleWillStart(_ testBundle: Bundle) {
            print(testBundle)
        }
        
        // https://developer.apple.com/documentation/xctest/xctestobservation/1501016-testsuitewillstart
        func testSuiteWillStart(_ testSuite: XCTestSuite) {
            print(testSuite)
        }
        
        // https://developer.apple.com/documentation/xctest/xctestobservation/1500527-testcasewillstart
        func testCaseWillStart(_ testCase: XCTestCase) {
            print(testCase)
        }
        
        // https://developer.apple.com/documentation/xctest/xctestobservation/3546551-testcase
        func testCase(_ testCase: XCTestCase, didRecord issue: XCTIssue) {
            print(issue)
        }
        
        // https://developer.apple.com/documentation/xctest/xctestobservation/3726091-testcase
        func testCase(_ testCase: XCTestCase, didRecord expectedFailure: XCTExpectedFailure) {
            print(testCase)
            print(expectedFailure)
        }
        
        // https://developer.apple.com/documentation/xctest/xctestobservation/1500326-testcasedidfinish
        func testCaseDidFinish(_ testCase: XCTestCase) {
            print(testCase)
        }
        
        // https://developer.apple.com/documentation/xctest/xctestobservation/3546552-testsuite
        func testSuite(_ testSuite: XCTestSuite, didRecord issue: XCTIssue) {
            print(issue)
        }
        
        // https://developer.apple.com/documentation/xctest/xctestobservation/3726092-testsuite
        func testSuite(_ testSuite: XCTestSuite, didRecord expectedFailure: XCTExpectedFailure) {
            print(expectedFailure)
        }
        
        // https://developer.apple.com/documentation/xctest/xctestobservation/1500958-testsuitedidfinish
        func testSuiteDidFinish(_ testSuite: XCTestSuite) {
            print(testSuite)
        }
        
        // https://developer.apple.com/documentation/xctest/xctestobservation/1500819-testbundledidfinish
        func testBundleDidFinish(_ testBundle: Bundle) {
            print(testBundle)
        }
    }
}
