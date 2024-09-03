//
//  LearnXCTKVOExpectation.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 03/09/24.
//

import XCTest

final class LearnXCTKVOExpectation: XCTestCase {

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

    func testCreatingKVOExpectation() {
        let myStruct = MyStruct()

        // https://developer.apple.com/documentation/xctest/xctkvoexpectation/2806841-init
        let expectation1 = XCTKVOExpectation(keyPath: "a", object: myStruct.a)

        // https://developer.apple.com/documentation/xctest/xctkvoexpectation/2806844-init
        let expectation2 = XCTKVOExpectation(keyPath: "a", object: myStruct.a, expectedValue: 10)

        // https://developer.apple.com/documentation/xctest/xctkvoexpectation/2806840-init
        let expectation3 = XCTKVOExpectation(keyPath: "a", object: myStruct.a, expectedValue: 10, options: [])
    }

    func testKVOExpectationProperties() {
        let myStruct = MyStruct()
        let expectation1 = XCTKVOExpectation(keyPath: "a", object: myStruct.a)

        // https://developer.apple.com/documentation/xctest/xctkvoexpectation/2806846-keypath
        print(expectation1.keyPath)

        // https://developer.apple.com/documentation/xctest/xctkvoexpectation/2806845-observedobject
        print(expectation1.observedObject)

        // https://developer.apple.com/documentation/xctest/xctkvoexpectation/2806842-expectedvalue
        print(expectation1.expectedValue)

        // https://developer.apple.com/documentation/xctest/xctkvoexpectation/2806839-options
        print(expectation1.options)
    }

    func testKVOEvalutation() {
        let myStruct = MyStruct()
        let expectation1 = XCTKVOExpectation(keyPath: "a", object: myStruct.a)

        // https://developer.apple.com/documentation/xctest/xctkvoexpectation/2806843-handler
        expectation1.handler = { value, dict in
            print(value, dict)
            return true
        }
    }


    struct MyStruct {
        var a: Int = 10
    }
}
