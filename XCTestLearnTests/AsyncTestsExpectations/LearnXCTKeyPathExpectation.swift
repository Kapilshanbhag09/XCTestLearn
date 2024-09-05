//
//  LearnXCTKeyPathExpectation.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 05/09/24.
//

import XCTest

// https://developer.apple.com/documentation/xctest/xctkeypathexpectation

final class LearnXCTKeyPathExpectation: XCTestCase {

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

    func testInit() {
        let myClass = MyVC()
        // https://developer.apple.com/documentation/xctest/xctkeypathexpectation/3991289-init
        let exptectation1 = XCTKeyPathExpectation(keyPath: \MyVC.a, observedObject: myClass, expectedValue: 10)

        wait(for: [exptectation1])

        // https://developer.apple.com/documentation/xctest/xctkeypathexpectation/asynchronousfilter
        let asyncFilter: XCTKeyPathExpectation<MyVC, Int>.AsynchronousFilter = { object, newValue in
            let obj = await object.a
            let new = newValue.newValue

            return obj == new
        }

        // https://developer.apple.com/documentation/xctest/xctkeypathexpectation/4115101-init
        let expectation2 = XCTKeyPathExpectation(keyPath: \MyVC.a, observedObject: myClass, filter: asyncFilter)

        //https://developer.apple.com/documentation/xctest/xctkeypathexpectation/synchronousfilter
        let syncFilter: XCTKeyPathExpectation<MyVC, Int>.SynchronousFilter = { object, newValue in
            return true
        }

        // https://developer.apple.com/documentation/xctest/xctkeypathexpectation/4115102-init
        let expectation3 = XCTKeyPathExpectation(keyPath: \MyVC.a, observedObject: myClass, filter: syncFilter)
    }

    func testProperties() {
        let myClass = MyVC()
        let expectation1 = XCTKeyPathExpectation(keyPath: \MyVC.a, observedObject: myClass, expectedValue: 10)

        // https://developer.apple.com/documentation/xctest/xctkeypathexpectation/3991291-keypath
        print(expectation1.keyPath)

        // https://developer.apple.com/documentation/xctest/xctkeypathexpectation/3991292-observedobject
        print(expectation1.observedObject)

        // https://developer.apple.com/documentation/xctest/xctkeypathexpectation/3991293-options
        print(expectation1.options)

        // https://developer.apple.com/documentation/xctest/xctkeypathexpectation/3991288-expectedvalue
        print(expectation1.expectedValue)
    }

    class MyVC: UIViewController {
        var a: Int = 10
    }
}
