//
//  LearnXCUIElementTypeQueryProviderTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 19/09/24.
//

import XCTest

final class LearnXCUIElementTypeQueryProviderTests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }

    func testExample() throws {

        // app.button gives the XCUIElementQuery.
        let buttonQuery = app.buttons

        // buttonQuery["MyAdd_Button"] refers to subscript(string:) of XCUIQueryElement
        // button refers to XCUIElement.
        let button = buttonQuery["MyAdd_Button"]

        // XCTAssert(button.exists)
        XCTAssert(button.exists)
        print(button.debugDescription)

        let myExpectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            button.tap()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            myExpectation.fulfill()
        }

        wait(for: [myExpectation])
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testFirstMatchVar() {

        // app.button gives the XCUIElementQuery.
        let buttonQuery = app.buttons

        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/2902250-firstmatch
        // Return the firstElement that has matched
        let button = buttonQuery.firstMatch
        print(button.title)

        // XCTAssert(button.exists)
        XCTAssert(button.exists)
        print(button.debugDescription)
    }

    func testDescendantElements() {

        // MARK: activityIndicators.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500770-activityindicators
        let activityIndicatorQuery = app.activityIndicators
        XCTAssert(activityIndicatorQuery.firstMatch.exists)
        print(activityIndicatorQuery.debugDescription)

        // MARK: alerts.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500430-alerts
        let alertsQuery = app.alerts
        XCTAssertFalse(alertsQuery.firstMatch.exists)
        print(alertsQuery.debugDescription)

        // MARK: browsers.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500652-browsers
        let browserQuery = app.browsers
        XCTAssertFalse(browserQuery.firstMatch.exists)
        print(browserQuery.debugDescription)

        // MARK: buttons.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500661-buttons
        let buttonQuery = app.buttons
        XCTAssertTrue(buttonQuery.firstMatch.exists)
        print(buttonQuery.debugDescription)

        // MARK: cells.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500840-cells
        let cellQuery = app.cells
        XCTAssertFalse(cellQuery.firstMatch.exists)
        print(cellQuery.debugDescription)

        let otherElementsQuery = app.otherElements
        print(otherElementsQuery.debugDescription)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
