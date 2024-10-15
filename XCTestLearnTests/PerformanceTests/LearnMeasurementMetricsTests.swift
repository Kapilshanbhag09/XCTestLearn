//
//  LearnMeasurementMetricsTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 15/10/24.
//

import XCTest

final class LearnMeasurementMetricsTests: XCTestCase {

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

    // https://developer.apple.com/documentation/xctest/xctmetric
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        let app =  XCUIApplication()
        let myMetric = MyMetrics()
        self.measure(metrics: [myMetric]) {
            // Put the code you want to measure the time of here.
            app.launch()
        }
    }

    class MyMetrics:NSObject, NSCopying, XCTMetric {
        func copy(with zone: NSZone? = nil) -> Any {
            return true
        }

        // https://developer.apple.com/documentation/xctest/xctmetric/3194242-willbeginmeasuring
        func willBeginMeasuring() {

        }

        // https://developer.apple.com/documentation/xctest/xctmetric/3194240-didstopmeasuring
        func didStopMeasuring() {

        }

        // https://developer.apple.com/documentation/xctest/xctmetric/3194241-reportmeasurements
        func reportMeasurements(from startTime: XCTPerformanceMeasurementTimestamp, to endTime: XCTPerformanceMeasurementTimestamp) throws -> [XCTPerformanceMeasurement] {
            return [XCTPerformanceMeasurement(identifier: "My_Identifier", displayName: "My Metric", doubleValue: 1.0, unitSymbol: "S")]
        }
    }

}
