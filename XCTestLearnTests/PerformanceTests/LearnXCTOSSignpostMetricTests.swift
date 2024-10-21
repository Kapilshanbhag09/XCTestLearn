//
//  LearnXCTOSSignpostMetricTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 21/10/24.
//

import XCTest

final class LearnXCTOSSignpostMetricTests: XCTestCase {

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
    
    // https://developer.apple.com/documentation/xctest/xctossignpostmetric/3194244-init
    func testInit() throws {
        let XCTOSSignpostMetric = XCTOSSignpostMetric(subsystem: "", category: "", name: "")
    }
    
    //
    func testMeasuringNavigation() throws {
        // https://developer.apple.com/documentation/xctest/xctossignpostmetric/3563916-customnavigationtransitionmetric
        let a = XCTOSSignpostMetric.customNavigationTransitionMetric
        
        // https://developer.apple.com/documentation/xctest/xctossignpostmetric/3563917-navigationtransitionmetric
        let b = XCTOSSignpostMetric.navigationTransitionMetric
        
        
    }
    
    func testScrollMetric() throws {
        // https://developer.apple.com/documentation/xctest/xctossignpostmetric/3746515-scrollinganddecelerationmetric
        let mertic = XCTOSSignpostMetric.scrollingAndDecelerationMetric
    }
}
