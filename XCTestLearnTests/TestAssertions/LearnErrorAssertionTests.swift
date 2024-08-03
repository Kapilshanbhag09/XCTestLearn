//
//  LearnErrorAssertionTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 03/08/24.
//

import XCTest

final class LearnErrorAssertionTests: XCTestCase {

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
    
    func testErrorAssertions() throws {
        // https://developer.apple.com/documentation/xctest/1500795-xctassertthrowserror
        XCTAssertThrowsError(try noError()) // Fails as noError() doesnt throw error.
        
        // https://developer.apple.com/documentation/xctest/2852885-xctassertnothrow
        XCTAssertNoThrow(try throwError()) // Fails as throwError throws error.
    }
    
    private func noError() throws {
        
    }
    
    private func throwError() throws {
        throw MyErrors.testError
    }
    
    enum MyErrors: Error {
        case testError
    }

}
