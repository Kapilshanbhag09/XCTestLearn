//
//  LearnXCTDarwinNotificationExpectation.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 10/09/24.
//

import XCTest

final class LearnXCTDarwinNotificationExpectation: XCTestCase {

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

    func testCreation() {
        // https://developer.apple.com/documentation/xctest/xctdarwinnotificationexpectation/2806823-init
        let expectation = XCTDarwinNotificationExpectation(notificationName: "my_darwin_notification")
    }

    func testProperties() {
        let expectation = XCTDarwinNotificationExpectation(notificationName: "my_darwin_notification")

        // https://developer.apple.com/documentation/xctest/xctdarwinnotificationexpectation/2806825-notificationname
        print(expectation.notificationName)
    }

    func testHandler() {
        let name = "my_darwin_notification"
        let expectation = XCTDarwinNotificationExpectation(notificationName: "my_darwin_notification")


        // https://developer.apple.com/documentation/xctest/xctdarwinnotificationexpectation/2806824-handler
        // https://developer.apple.com/documentation/xctest/xctdarwinnotificationexpectation/handler

        expectation.handler = {
            return true
        }
    }

    func testWorking() {
        let name = "my_darwin_notification"
        let expectation = XCTDarwinNotificationExpectation(notificationName: name)

        let notificationCenter = CFNotificationCenterGetDarwinNotifyCenter()
        CFNotificationCenterPostNotification(notificationCenter, CFNotificationName(name as CFString), nil, nil, true)

        wait(for: [expectation], timeout: 1.0)
    }
}
