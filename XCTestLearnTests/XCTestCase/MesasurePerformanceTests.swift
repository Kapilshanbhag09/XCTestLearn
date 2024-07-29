//
//  MesasurePerformanceTests.swift
//  XCTestLearnTests
//
//  Created by Kapil Shanbhag on 10/06/24.
//

import XCTest
@testable import XCTestLearn

final class MesasurePerformanceTests: XCTestCase {

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
    
    //MARK: measure()
    func testPerformanceExample() throws {
        var performanceMetric: XCTPerformanceMetric = XCTPerformanceMetric.wallClockTime
        let cpuMetric: XCTCPUMetric = XCTCPUMetric()
        let memoryMetric: XCTMemoryMetric = XCTMemoryMetric()
        
        /// Measure Performance using these functions.
        
        // https://developer.apple.com/documentation/xctest/xctestcase/1496290-measure
        //        self.measure {
        //            printLoop()
        //        }
        
        // https://developer.apple.com/documentation/xctest/xctestcase/1496277-measuremetrics
        //        self.measureMetrics([performanceMetric], automaticallyStartMeasuring: true) {
        //            printLoop()
        //        }
        
        // https://developer.apple.com/documentation/xctest/xctestcase/3194264-measure
        //        self.measure(metrics: [cpuMetric, memoryMetric]) {
        //            printLoop()
        //        }
        
        // https://developer.apple.com/documentation/xctest/xctestcase/3194265-measure
        //        self.measure(metrics: [cpuMetric, memoryMetric], options: .default) {
        //            printLoop()
        //        }
        
        // https://developer.apple.com/documentation/xctest/xctestcase/3194266-measure
        //        self.measure(options: .default) {
        //            printLoop()
        //        }
    }
    
    
    //MARK: Start and Stop Measuring
    func testStartAndStopMeasuring() {
        self.measureMetrics([XCTPerformanceMetric.wallClockTime], automaticallyStartMeasuring: false) {
            // https://developer.apple.com/documentation/xctest/xctestcase/1496264-startmeasuring
            startMeasuring() // Start measuring
            printLoop()
            // https://developer.apple.com/documentation/xctest/xctestcase/1496279-stopmeasuring
            stopMeasuring() // Stop measuring
            
            /// if automaticallyStartMeasuring is true, startMeasuring & stopMeasuring wont have any effect!
        }
        
        defaultMetricsAndOptions()
    }
    
    //MARK:  Default Metric and Options.
    func defaultMetricsAndOptions() {
        // https://developer.apple.com/documentation/xctest/xctestcase/1496284-defaultperformancemetrics
        print(XCTestCase.defaultPerformanceMetrics) // Used in measure()
        
        // https://developer.apple.com/documentation/xctest/xctestcase/3194263-defaultmetrics
        print(XCTestCase.defaultMetrics) // Used in measure(options:block:)
        
        // https://developer.apple.com/documentation/xctest/xctestcase/3194262-defaultmeasureoptions
        print(XCTestCase.defaultMeasureOptions) // Used in measure()
    }
    
    private func printLoop() {
        for i in 0...10000 {
//            print(i)
        }
    }
    
    //MARK: XCTPerformanceMetric
    func testPerformanceMetric() {
        let wallClockMetric: XCTPerformanceMetric = .init("com.apple.XCTPerformanceMetric_WallClockTime")
        
        self.measureMetrics([wallClockMetric], automaticallyStartMeasuring: true) {
            printLoop()
        }
    }

}
