//
//  LearnCPUMetricsTest.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 17/10/24.
//
import XCTest
import XCTestLearn

final class LearnCPUMetricsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    // https://developer.apple.com/documentation/xctest/xctcpumetric
    /// Calculate
    /// 1 - CPU time
    /// 2 - CPU Cycles
    /// 3 - CPU instructions retired

    // https://developer.apple.com/documentation/xctest/xctcpumetric/3194231-init
    func testInitializer1() {
        let vc = ViewController()
        let cpuMetric = XCTCPUMetric()
        self.measure(metrics: [cpuMetric]) {
            let _ = vc.isEven(number: 10)
        }
    }

    // https://developer.apple.com/documentation/xctest/xctcpumetric/3194233-init
    func testInitializer2() {
        let app = XCUIApplication()
        let vc = ViewController()
        let cpuMetric = XCTCPUMetric(application: app)
        self.measure(metrics: [cpuMetric]) {
            let _ = vc.isEven(number: 10)
        }
    }

    // https://developer.apple.com/documentation/xctest/xctcpumetric/3194232-init
    func testInitializer3() {
        let app = XCUIApplication()
        let vc = ViewController()
        let cpuMetric = XCTCPUMetric(limitingToCurrentThread: false)
        self.measure(metrics: [cpuMetric]) {
            let _ = vc.isEven(number: 10)
        }
    }
}
