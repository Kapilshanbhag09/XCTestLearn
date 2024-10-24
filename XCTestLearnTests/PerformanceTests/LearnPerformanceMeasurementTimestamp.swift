//
//  LearnPerformanceMeasurementTimestamp.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 22/10/24.
//

import XCTest

final class LearnPerformanceMeasurementTimestamp: XCTestCase {

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

    func testPerformancetime() throws {
        // https://developer.apple.com/documentation/xctest/xctperformancemeasurementtimestamp/3194257-init
        let time = XCTPerformanceMeasurementTimestamp()

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurementtimestamp/3194258-init
        let time2 = XCTPerformanceMeasurementTimestamp(absoluteTime: 0, date: Date())

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurementtimestamp/3194255-absolutetimenanoseconds
        print(time.absoluteTimeNanoSeconds)

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurementtimestamp/3194254-absolutetime
        print(time2.absoluteTime)

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurementtimestamp/3194256-date
        print(time.date)
    }
}
