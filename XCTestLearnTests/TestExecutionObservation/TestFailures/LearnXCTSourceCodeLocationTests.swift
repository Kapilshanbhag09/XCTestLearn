//
//  LearnXCTSourceCodeLocationTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 09/11/24.
//

import XCTest

final class LearnXCTSourceCodeLocationTests: XCTestCase {

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

    func testInitializers() throws {
        let url = URL(filePath: "./LearnXCTSourceCodeLocationTests.swift")
        // https://developer.apple.com/documentation/xctest/xctsourcecodelocation/3546542-init
        let sourceCodeLocation1 = XCTSourceCodeLocation(fileURL: url, lineNumber: #line)

        // https://developer.apple.com/documentation/xctest/xctsourcecodelocation/3546541-init
        // https://developer.apple.com/documentation/xctest/xctsourcecodelocation/3601079-init
        let sourceCodeLocation2 = XCTSourceCodeLocation(filePath: #filePath, lineNumber: #line)
    }

    func testInfo() throws {
        let sourceCodeLocation = XCTSourceCodeLocation(filePath: #filePath, lineNumber: #line)
        // https://developer.apple.com/documentation/xctest/xctsourcecodelocation/3546540-fileurl
        print(sourceCodeLocation.fileURL)
        // https://developer.apple.com/documentation/xctest/xctsourcecodelocation/3546543-linenumber
        print(sourceCodeLocation.lineNumber)
    }

}
