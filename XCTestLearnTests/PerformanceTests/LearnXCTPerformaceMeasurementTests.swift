//
//  LearnXCTPerformaceMeasurementTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 22/10/24.
//

import XCTest

final class LearnXCTPerformaceMeasurementTests: XCTestCase {

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

    func testPerformanceMeasurementCreation() throws {
        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3194249-init
        let init1 = XCTPerformanceMeasurement(identifier: "My_Measurement1", displayName: "My Measurement 1", doubleValue: 1.0, unitSymbol: "K")

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3746516-init
        let init2 = XCTPerformanceMeasurement(identifier: "My_Measurement2", displayName: "My Measurement 2", doubleValue: 1.0, unitSymbol: "K", polarity: .prefersLarger)

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3194250-init
        let init3 = XCTPerformanceMeasurement(identifier: "My_Measurement3", displayName: "My Measurement 3", value: Measurement(value: 10.0, unit: .init(symbol: "K")))

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3746517-init
        let init4 = XCTPerformanceMeasurement(identifier: "My_Measurement3", displayName: "My Measurement 3", value: Measurement(value: 10.0, unit: .init(symbol: "K")), polarity: .prefersLarger)
    }

    func testIdentifyingMeasurements() throws {
        let measurement: XCTPerformanceMeasurement = XCTPerformanceMeasurement(identifier: "My_Measurement", displayName: "My Measurement", doubleValue: 10, unitSymbol: "K")

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3194246-displayname
        print(measurement.displayName)

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3194248-identifier
        print(measurement.identifier)
    }

    func testMeasuringValues() throws {
        let measurement: XCTPerformanceMeasurement = XCTPerformanceMeasurement(identifier: "My_Measurement", displayName: "My Measurement", doubleValue: 10, unitSymbol: "K")

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3194247-doublevalue
        print(measurement.doubleValue)

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3194251-unitsymbol
        print(measurement.unitSymbol)

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3194252-value
        print(measurement.value)

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/3194252-value
        print(measurement.polarity)
    }

    func testMeasurementPolarity() throws {
        let measurement = XCTPerformanceMeasurement(identifier: "My_Measurement3", displayName: "My Measurement 3", value: Measurement(value: 10.0, unit: .init(symbol: "K")), polarity: .prefersLarger)

        // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/polarity
        switch measurement.polarity {
            // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/polarity/preferssmaller
        case .prefersSmaller:
            break
            // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/polarity/unspecified
        case .unspecified:
            break
            // https://developer.apple.com/documentation/xctest/xctperformancemeasurement/polarity/preferslarger
        case .prefersLarger:
            break
        @unknown default:
            break
        }
    }

    class MyMetric: NSObject, NSCopying, XCTMetric {
        func copy(with zone: NSZone? = nil) -> Any {
            return 0
        }

        let measurement: XCTPerformanceMeasurement = XCTPerformanceMeasurement(identifier: "My_Measurement", displayName: "My Measurement", doubleValue: 10, unitSymbol: "K")

        func reportMeasurements(from startTime: XCTPerformanceMeasurementTimestamp, to endTime: XCTPerformanceMeasurementTimestamp) throws -> [XCTPerformanceMeasurement] {
            return [measurement]
        }
        func willBeginMeasuring() {
            
        }

        func didStopMeasuring() {

        }
    }
}
