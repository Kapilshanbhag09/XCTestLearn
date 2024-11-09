//
//  LearnXCTSourceCodeFrame.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 09/11/24.
//

import XCTest

final class LearnXCTSourceCodeFrame: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let issue = XCTIssue(type: .assertionFailure, compactDescription: "My_Sample")
        record(issue)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testInitializer() {
        // https://developer.apple.com/documentation/xctest/xctsourcecodeframe/3573855-init
        let frame1 = XCTSourceCodeFrame(address: 1, symbolInfo: nil)

        // https://developer.apple.com/documentation/xctest/xctsourcecodeframe/3546536-init
        let frame2 = XCTSourceCodeFrame(address: 1)
    }

    override func record(_ issue: XCTIssue) {
        super.record(issue)
        print("Source Code Context is")

        let _ = issue.sourceCodeContext.callStack.map { frame in
            print("=XCTSourceCodeContextFrame=")
            // https://developer.apple.com/documentation/xctest/xctsourcecodeframe/3546535-address
            print("The adress is")
            print(frame.address)
            // https://developer.apple.com/documentation/xctest/xctsourcecodeframe/3573856-symbolinfo
            print("The symbolInfo is")
            print(frame.symbolInfo)
            // https://developer.apple.com/documentation/xctest/xctsourcecodeframe/3546538-symbolicationerror
            print("The symbolicationError is")
            print(frame.symbolicationError)
            // https://developer.apple.com/documentation/xctest/xctsourcecodeframe/3546537-symbolinfo
            print("The Get symbolInfo()")
            do {
                try print(frame.symbolInfo())
            }
            catch {

            }
        }
    }

}
