//
//  LearnComparableAssertionTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 03/08/24.
//

import XCTest

final class LearnComparableAssertionTests: XCTestCase {

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
    
    func testComparableAssertion() throws {
        // https://developer.apple.com/documentation/xctest/1500938-xctassertgreaterthan
        XCTAssertGreaterThan(10, 10) // Generates error as 10 <= 10.
        
        // https://developer.apple.com/documentation/xctest/1500833-xctassertgreaterthanorequal
        XCTAssertGreaterThanOrEqual(9, 10) // Generates error as 9 < 10.
        
        // https://developer.apple.com/documentation/xctest/1500804-xctassertlessthanorequal
        XCTAssertLessThanOrEqual(11, 10) // Generates error as 11 > 10.
        
        // https://developer.apple.com/documentation/xctest/1500384-xctassertlessthan
        XCTAssertLessThan(10, 10) // Generates error as 10 >= 10.
    }
}
