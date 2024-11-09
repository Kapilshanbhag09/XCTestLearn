//
//  LearnXCTMutableIssueTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 09/11/24.
//

import XCTest

final class LearnXCTMutableIssueTests: XCTestCase {

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

    // https://developer.apple.com/documentation/xctest/xctmutableissue
    func testMutableIssue() throws {
        let mutableIssue = XCTMutableIssue(type: .assertionFailure, compactDescription: "Hello")
        // https://developer.apple.com/documentation/xctest/xctmutableissue
        record(mutableIssue as XCTIssue)

        // Issue Details
        // https://developer.apple.com/documentation/xctest/xctmutableissue/3546526-type
        // https://developer.apple.com/documentation/xctest/xctmutableissue/3546523-compactdescription
        // https://developer.apple.com/documentation/xctest/xctmutableissue/3546524-detaileddescription
        // https://developer.apple.com/documentation/xctest/xctmutableissue/3546525-sourcecodecontext
        // https://developer.apple.com/documentation/xctest/xctmutableissue/3546521-associatederror
        // https://developer.apple.com/documentation/xctest/xctmutableissue/3546522-attachments
        // https://developer.apple.com/documentation/xctest/xctmutableissue/3563912-add
    }
}
