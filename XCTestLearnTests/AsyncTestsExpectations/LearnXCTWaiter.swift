//
//  LearnXCTWaiter.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 11/09/24.
//

import XCTest

final class LearnXCTWaiter: XCTestCase {

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
    
    func testCreatingWaiter() {
        let waiter = XCTWaiter(delegate: nil)
    }
    
    // https://developer.apple.com/documentation/xctest/xctwaiter/4109475-fulfillment
    func testWaitForExpectationMethod1() async {
        let waiter = XCTWaiter(delegate: nil)
        let expectation = XCTestExpectation(description: "My Expectation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            expectation.fulfill()
        }
        
        let result = await waiter.fulfillment(of: [expectation], timeout: 2.0)
        
        print(result)
    }
    
    // https://developer.apple.com/documentation/xctest/xctwaiter/result
    func testWaitForExpectationMethod2() {
        let waiter = XCTWaiter(delegate: nil)
        let expectation = XCTestExpectation(description: "My Expectation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }
        
        let result = waiter.wait(for: [expectation])
        print(result.rawValue) // 1 -> Completed
    }
    
    // https://developer.apple.com/documentation/xctest/xctwaiter/4116357-wait
    func testWaitForExpectationMethod3() {
        let waiter = XCTWaiter(delegate: nil)
        let expectation1 = XCTestExpectation(description: "My Expectation1")
        let expectation2 = XCTestExpectation(description: "My Expectation2")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation2.fulfill()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            expectation1.fulfill()
        }
        
        let result = waiter.wait(for: [expectation1, expectation2], enforceOrder: true)
        print(result.rawValue) // 3 -> incorrectOrder. The correct order is 1,2. But expectation 2 if fulfilled before 1.
    }
    
    // https://developer.apple.com/documentation/xctest/xctwaiter/2806744-wait
    func testWaitForExpectationMethod4() {
        let waiter = XCTWaiter(delegate: nil)
        let expectation = XCTestExpectation(description: "My Expectation")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            expectation.fulfill()
        }
        
        
        let result = waiter.wait(for: [expectation], timeout: 1.0)
        print(result.rawValue) // 2 -> timeout. As the expectation is not fulfilled in 1 sec.
    }
    
    // https://developer.apple.com/documentation/xctest/xctwaiter/2806740-wait
    func testWaitForExpectationMethod5() {
        let waiter = XCTWaiter(delegate: nil)
        let expectation1 = XCTestExpectation(description: "My Expectation1")
        let expectation2 = XCTestExpectation(description: "My Expectation2")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation2.fulfill()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            expectation1.fulfill()
        }
        
        let result = waiter.wait(for: [expectation1, expectation2], timeout: 1.0, enforceOrder: true)
        print(result.rawValue) // 3 -> incorrectOrder. The correct order is 1,2. But expectation 2 if fulfilled before 1.
    }
    
    // Rest are same methods as above but the class methods.
    // https://developer.apple.com/documentation/xctest/xctwaiter/4109474-fulfillment
    // https://developer.apple.com/documentation/xctest/xctwaiter/4116354-wait
    // https://developer.apple.com/documentation/xctest/xctwaiter/4116356-wait
    // https://developer.apple.com/documentation/xctest/xctwaiter/2806750-wait
    // https://developer.apple.com/documentation/xctest/xctwaiter/2806738-wait
    
    func testWaitForExpectationClassMethods() {
        let expectation1 = XCTestExpectation(description: "My Expectation1")
        let expectation2 = XCTestExpectation(description: "My Expectation2")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation2.fulfill()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            expectation1.fulfill()
        }
        
        let result = XCTWaiter.wait(for: [expectation1, expectation2], timeout: 1.0, enforceOrder: true)
        print(result.rawValue) // 3 -> incorrectOrder. The correct order is 1,2. But expectation 2 if fulfilled before 1.
    }
    
    // https://developer.apple.com/documentation/xctest/xctwaiter/result
    func testXCTWaiterResult() {
        let expectation1 = XCTestExpectation(description: "My Expectation1")
        
        let result = XCTWaiter.wait(for: [expectation1], timeout: 1.0)
        
        switch result {
        case .completed: print("completed \(result.rawValue)")
        case .timedOut: print("timedOut \(result.rawValue)")
        case .incorrectOrder: print("incorrectOrder \(result.rawValue)")
        case .invertedFulfillment: print("invertedFulfillment \(result.rawValue)")
        case .interrupted: print("interrupted \(result.rawValue)")
        @unknown default:
            print("Some Other error")
        }
    }

    // https://developer.apple.com/documentation/xctest/xctwaiter/2806737-delegate
    func testXCTWaiterDelegate() {
        let expectation = XCTestExpectation(description: "My Expectation")
        let delegate = MyMockDelegate()
        let waiter = XCTWaiter()
        waiter.delegate = delegate

        waiter.wait(for: [expectation], timeout: 1.0)
    }

    // https://developer.apple.com/documentation/xctest/xctwaiter/2806739-fulfilledexpectations
    func testFulfilledExpecation() {
        let expectation = XCTestExpectation(description: "My Expectation")
        let waiter = XCTWaiter()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }

        waiter.wait(for: [expectation], timeout: 1.5)

        // Contains expectation in order of fulfillment.
        // Expectation fulfilled first will in first.
        print(waiter.fulfilledExpectations)
    }

    class MyMockDelegate: NSObject, XCTWaiterDelegate {
        // https://developer.apple.com/documentation/xctest/xctwaiterdelegate/2806734-waiter
        func waiter(_ waiter: XCTWaiter, didTimeoutWithUnfulfilledExpectations unfulfilledExpectations: [XCTestExpectation]) {
            print("Expectation is not fulfilled")
        }

        // https://developer.apple.com/documentation/xctest/xctwaiterdelegate/2852132-nestedwaiter
        func nestedWaiter(_ waiter: XCTWaiter, wasInterruptedByTimedOutWaiter outerWaiter: XCTWaiter) {
            print("Expectation interupted by nested Waiter")
        }

        // https://developer.apple.com/documentation/xctest/xctwaiterdelegate/2806735-waiter
        func waiter(_ waiter: XCTWaiter, fulfillmentDidViolateOrderingConstraintsFor expectation: XCTestExpectation, requiredExpectation: XCTestExpectation) {
            print("Expecatation fulfilled in wrong order")
        }

        // https://developer.apple.com/documentation/xctest/xctwaiterdelegate/2806745-waiter
        func waiter(_ waiter: XCTWaiter, didFulfillInvertedExpectation expectation: XCTestExpectation) {
            print("Inverted expectation was fulfilled")
        }
    }
}
