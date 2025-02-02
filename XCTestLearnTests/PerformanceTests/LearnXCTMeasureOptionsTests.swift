//
//  LearnXCTMeasureOptionsTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 15/10/24.
//

import XCTest

final class LearnXCTMeasureOptionsTests: XCTestCase {

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
        let app = XCUIApplication()
        // This is an example of a performance test case.
        // https://developer.apple.com/documentation/xctest/xctmeasureoptions/3194223-default
        let option = XCTMeasureOptions.default

        // https://developer.apple.com/documentation/xctest/xctmeasureoptions/3194224-invocationoptions
        // https://developer.apple.com/documentation/xctest/xctmeasureoptions/invocationoptions/3194227-manuallystart
        option.invocationOptions = .manuallyStart

        // https://developer.apple.com/documentation/xctest/xctmeasureoptions/invocationoptions/3194228-manuallystop
        option.invocationOptions = .manuallyStop

        // https://developer.apple.com/documentation/xctest/xctmeasureoptions/3194225-iterationcount
        option.iterationCount = 2


        self.measure(options: option) {
            // Put the code you want to measure the time of here.
            app.launch()
        }
    }
}
