//
//  LearnXCTIssueReferenceTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 09/11/24.
//

import XCTest

final class LearnXCTIssueReferenceTests: XCTestCase {

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

    // https://developer.apple.com/documentation/xctest/xctissuereference
    // Use when you want to bridge to Objc-C XCTIssue.
    // use when you need a reference semantics.

    func testInitializers() throws {
        // https://developer.apple.com/documentation/xctest/xctissuereference/3563910-init
        let issue1 = XCTIssueReference(type: .assertionFailure, compactDescription: "My_Issue_Reference")
        record(issue1 as XCTIssue)

        // https://developer.apple.com/documentation/xctest/xctissuereference/3563911-init
        let issue2 = XCTIssueReference(type: .assertionFailure, 
                                       compactDescription: "My_Issue_Reference", 
                                       detailedDescription: "Nothing",
                                       sourceCodeContext: .init(), 
                                       associatedError: nil,
                                       attachments: [])

        throw CustomError.myTest
    }

    func testIssueTypes()  {
        // https://developer.apple.com/documentation/xctest/xctissuereference/issuetype
        let issueType: XCTIssueReference.IssueType = .assertionFailure

        switch issueType {
            // https://developer.apple.com/documentation/xctest/xctissuereference/issuetype/assertionfailure
        case .assertionFailure: break
            // https://developer.apple.com/documentation/xctest/xctissuereference/issuetype/performanceregression
            // Cause of some performance not matching the expected performance
        case .performanceRegression: break
            // https://developer.apple.com/documentation/xctest/xctissuereference/issuetype/system
            // Some internal failure
        case .system: break
            // https://developer.apple.com/documentation/xctest/xctissuereference/issuetype/thrownerror
            // When the test throws any error
        case .thrownError: break
            // https://developer.apple.com/documentation/xctest/xctissuereference/issuetype/uncaughtexception
            // When the exception in the code is not caught.
        case .uncaughtException: break
            // https://developer.apple.com/documentation/xctest/xctissuereference/issuetype/unmatchedexpectedfailure
            // When expected failure doesn't occur.
        case .unmatchedExpectedFailure: break
        @unknown default:
            break
        }
    }

    func testIssueDetails() {
        let issue = XCTIssueReference(type: .assertionFailure, compactDescription: "My_Failure")
        // https://developer.apple.com/documentation/xctest/xctissuereference/3546513-type
        print(issue.type)
        // https://developer.apple.com/documentation/xctest/xctissuereference/3546508-compactdescription
        print(issue.compactDescription)
        // https://developer.apple.com/documentation/xctest/xctissuereference/3546509-detaileddescription
        print(issue.detailedDescription)
        // https://developer.apple.com/documentation/xctest/xctissuereference/3546512-sourcecodecontext
        print(issue.sourceCodeContext)
        // https://developer.apple.com/documentation/xctest/xctissuereference/3546506-associatederror
        print(issue.associatedError)
        // https://developer.apple.com/documentation/xctest/xctissuereference/3546507-attachments
        print(issue.attachments)
    }

    override func record(_ issue: XCTIssue) {
        if issue.type == .thrownError {
            print("Thrown Error")
        }
        print(issue.type)
    }

    enum CustomError: Error {
        case myTest
    }

}
