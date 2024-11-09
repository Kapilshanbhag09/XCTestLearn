//
//  LearnXCTSourceCodeContextTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 09/11/24.
//

import XCTest

final class LearnXCTSourceCodeContextTests: XCTestCase {

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

    func testSourceCodeContext() throws {
        let issue = XCTIssue(type: .assertionFailure, compactDescription: "My_Sample")
        record(issue)
    }

    func testInitializers() throws {
        // https://developer.apple.com/documentation/xctest/xctsourcecodecontext/3546530-init
        let sourceCodeContext1 = XCTSourceCodeContext(callStack: [], location: nil)

        // https://developer.apple.com/documentation/xctest/xctsourcecodecontext/3546531-init
        let sourceCodeContext2 = XCTSourceCodeContext(callStackAddresses: [], location: nil)

        // https://developer.apple.com/documentation/xctest/xctsourcecodecontext/3546532-init
        let sourceCodeContext3 = XCTSourceCodeContext(location: nil)

        // https://developer.apple.com/documentation/xctest/xctsourcecodecontext/3546529-init
        let sourceCodeContext4 = XCTSourceCodeContext()
    }

    func testContextInformation() throws {
        let sourceCodeContext = XCTSourceCodeContext(callStack: [], location: nil)

        // https://developer.apple.com/documentation/xctest/xctsourcecodecontext/3546528-callstack
        print(sourceCodeContext.callStack)

        // https://developer.apple.com/documentation/xctest/xctsourcecodecontext/3546533-location
        print(sourceCodeContext.location)
    }

    override func record(_ issue: XCTIssue) {
        super.record(issue)
        print("Source Code Context is")
        print(issue.sourceCodeContext)
        print(issue.sourceCodeContext.callStack)
        print(issue.sourceCodeContext.location)
    }
}
