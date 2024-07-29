//
//  XCTestLearnUITests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 28/05/24.
//

import XCTest

final class XCTestLearnUITests: XCTestCase {

    // Setting this to true make our UI test run for each and every possible combination of orientation, appearanc
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        return true
    }
    
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

        let keyPath: KeyPath = \MyClass.a
        let t = MyClass()
        let expectation7 = expectation(that: keyPath, on: t, willEqual: 10)
    }

    class MyClass {
        var a: Int = 10
        
        init() {
            
        }
    }
}
