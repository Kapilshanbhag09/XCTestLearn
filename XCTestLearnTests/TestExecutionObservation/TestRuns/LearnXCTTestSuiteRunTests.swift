//
//  LearnXCTTestSuiteRunTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 10/11/24.
//

import XCTest

final class LearnXCTTestSuiteRunTests: XCTestCase {

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
    
    // https://developer.apple.com/documentation/xctest/xctestsuiterun
    func testTestSuiteRun() throws {
        let suiteRun = XCTestSuiteRun(test: self)
        let testRun = XCTestRun(test: self)
        // https://developer.apple.com/documentation/xctest/xctestsuiterun/1426489-addtestrun
        suiteRun.addTestRun(testRun)
        
        // https://developer.apple.com/documentation/xctest/xctestsuiterun/1426486-testruns
        print(suiteRun.testRuns)
    }
}
