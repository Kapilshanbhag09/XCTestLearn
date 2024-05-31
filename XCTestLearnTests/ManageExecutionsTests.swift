//
//  ManageExecutionsTests.swift
//  XCTestLearnTests
//
//  Created by Kapil Shanbhag on 31/05/24.
//

import XCTest

final class ManageExecutionsTests: XCTestCase {
    
    func testExample() throws {
        continueAfterFailure = false
        XCTAssert(false)
        // If continueAfterFailure is true aftermatch error code is executed.
        if continueAfterFailure == true {
            print("I am called after failure")
        }// Else the code will never come here.
    }
    
    func testExecutionTimeAllowance() {
        // Gives error when execution crosses 1 minute.
        executionTimeAllowance = 1.0 // 1.0 in seconds, this will be rounded off to 1 minutes.
        
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 65.0) {
            print("Executed after 120 minutes")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 100.0)
        
    }
    
    func testSecondExample() {
        // continueAfterFailure for this method will be true by default.
        // executionTimeAllowance for this method is 600 by default.
        // Changes made for these 2 propery not reflected here.
    }
    
    //runsForEachTargetApplicationConfiguration is in XCTestLearnUITests.

}
