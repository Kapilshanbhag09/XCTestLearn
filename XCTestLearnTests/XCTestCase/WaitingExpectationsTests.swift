//
//  WaitingExpectationsTest.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 29/07/24.
//

import XCTest

final class WaitingExpectationsTests: XCTestCase {

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
    // https://developer.apple.com/documentation/xctest/xctestcase/4109476-fulfillment
    func testFulfillments() async {
        let expectation = expectation(description: "Test_Expectations")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 1.0)

        // fulfillment() vs wait()
        /// - fulfillment is @nonObjc i.e its not supported in Objective C.
        /// - fulfillment is used for concurrency-safe alternative to wait.
        /// - wait is not available in async context.
    }

    func testWaitExpectations() throws {
        let expectation = expectation(description: "Test_Expectations")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            expectation.fulfill()
        }

        // https://developer.apple.com/documentation/xctest/xctestcase/4116358-wait
//        wait(for: [expectation])

        // https://developer.apple.com/documentation/xctest/xctestcase/4116359-wait
//        wait(for: [expectation], enforceOrder: true)

        // https://developer.apple.com/documentation/xctest/xctestcase/2806856-wait
//        wait(for: [expectation], timeout: 1.0)

        // https://developer.apple.com/documentation/xctest/xctestcase/2806857-wait
//        wait(for: [expectation], timeout: 1.0, enforceOrder: true)

        // https://developer.apple.com/documentation/xctest/xctestcase/1500748-waitforexpectations
//        waitForExpectations(timeout: 1.0) { error in
//
//        }
        // https://developer.apple.com/documentation/xctest/xcwaitcompletionhandler
        let handler: XCWaitCompletionHandler = { error in
            if let err = error {
                print(err)
            }
        }
        /// enforceOrder: If true, the expectations must be satisfied in the given order in array.
    }

    //MARK: XCTestError.
    func testXCTestError() throws {
        // https://developer.apple.com/documentation/xctest/xctesterror/3727252-init
        let error: XCTestError = XCTestError(XCTestError.Code(rawValue: 100) ?? .failureWhileWaiting, userInfo: [:])


        let myExpectation: XCTestExpectation = expectation(description: "My Expectation")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            myExpectation.fulfill()
        }

        waitForExpectations(timeout: 1.0) { error in
            guard let xcTestError = error as? XCTestError else {return}
            // https://developer.apple.com/documentation/xctest/xctesterror/3727249-code
            print(xcTestError.code)

            // https://developer.apple.com/documentation/xctest/xctesterror/2897655-errorcode
            print(xcTestError.errorCode)

            // https://developer.apple.com/documentation/xctest/xctesterror/2897661-erroruserinfo
            print(xcTestError.errorUserInfo)

            // https://developer.apple.com/documentation/xctest/xctesterror/2897663-localizeddescription
            print(xcTestError.localizedDescription)

            // https://developer.apple.com/documentation/xctest/xctesterror/3727253-userinfo
            print(xcTestError.userInfo)

            // https://developer.apple.com/documentation/xctest/xctesterror/2897665-timeoutwhilewaiting
            print(xcTestError.code == .timeoutWhileWaiting)

            // https://developer.apple.com/documentation/xctest/xctesterror/2897662-failurewhilewaiting
            print(xcTestError.code == .failureWhileWaiting)

            // Error Domain.
            // TODO: Learn more about error domain.
            // https://developer.apple.com/documentation/xctest/xctesterror/2897657-errordomain
            print(XCTestError.errorDomain)
            // https://developer.apple.com/documentation/xctest/xctesterrordomain
            print(XCTestErrorDomain)
        }
    }

}
