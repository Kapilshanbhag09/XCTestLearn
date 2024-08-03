//
//  LearnEqualityAndNonEqualityAssertionTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 02/08/24.
//

import XCTest


// https://developer.apple.com/documentation/xctest/equality_and_inequality_assertions
final class LearnEqualityAndNonEqualityAssertionTests: XCTestCase {

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

    func testEqualityAndNonEquality() throws {
        let a: Int = 10
        let b: Int = 20
        // https://developer.apple.com/documentation/xctest/2142776-xctassertequal
        XCTAssertEqual(a, b)

        let c: Int = 10
        // https://developer.apple.com/documentation/xctest/2142777-xctassertnotequal
        XCTAssertNotEqual(a, c)
    }

    func testIdenticalObjects() throws {
        let a: MyClass = MyClass()
        var b: MyClass = MyClass()

        // https://developer.apple.com/documentation/xctest/3727243-xctassertidentical
        XCTAssertIdentical(a, b)

        // https://developer.apple.com/documentation/xctest/3727244-xctassertnotidentical
        b = a
        XCTAssertNotIdentical(a, b)
    }
    
    func testFloatingPointAssertion() throws {
        // https://developer.apple.com/documentation/xctest/2919914-xctassertequal
        XCTAssertEqual(8.0, 9.1, accuracy: 1) // Fail as 9.1 - 8.0 > 1.
        
        // https://developer.apple.com/documentation/xctest/3551607-xctassertequal
        XCTAssertEqual(9, 11, accuracy: 1) // Fail as 11 - 9 > 1
        
        // https://developer.apple.com/documentation/xctest/2919913-xctassertnotequal
        XCTAssertNotEqual(8.0, 8.2, accuracy: 1) // Fail as 8.2 - 8.1 < 1
        
        // https://developer.apple.com/documentation/xctest/3551608-xctassertnotequal
        XCTAssertNotEqual(8, 9, accuracy: 2) // Fail as 9 - 8 < 1
    }

    class MyClass {

    }
}
