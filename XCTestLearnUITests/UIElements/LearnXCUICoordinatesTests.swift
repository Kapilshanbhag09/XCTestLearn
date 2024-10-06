//
//  LearnXCUICoordinatesTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 03/10/24.
//

import XCTest

final class LearnXCUICoordinatesTests: XCTestCase {

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

    func testGettingProperty() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1500513-referencedelement
        print(button.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0)))
        let coordinate = button.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1500505-screenpoint
        print(coordinate.screenPoint)
    }

    func testMovingPointer() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]
        let coordinate = button.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1501021-hover
        coordinate.hover()
    }

    func testClick() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]
        let coordinate = button.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
        let newCoordinate = coordinate.withOffset(CGVector(dx: 10.0, dy: 10.0))

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1500677-click
        coordinate.click()

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1500369-click
        coordinate.click(forDuration: 1.0, thenDragTo: newCoordinate)

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3553191-click
        coordinate.click(forDuration: 1.0, thenDragTo: newCoordinate, withVelocity: XCUIGestureVelocity.default, thenHoldForDuration: 1.0)

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1500302-doubleclick
        coordinate.doubleClick()

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1500503-rightclick
        coordinate.rightClick()

        // NOTE: These are not available in iOS. Only for MacOS & iPadOS.
    }

    func testScrolling() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]
        let coordinate = button.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))

        coordinate.scroll(byDeltaX: 1.0, deltaY: 1.0)
    }

    func testTappingAndPressing() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]
        let coordinate = button.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
        let newCoordinate = coordinate.withOffset(CGVector(dx: 0.0, dy: 0.0))

        //https://developer.apple.com/documentation/xctest/xcuicoordinate/1615004-tap
        coordinate.tap()

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1615005-doubletap
        coordinate.doubleTap()

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1615002-press
        coordinate.press(forDuration: 1.0)

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1615003-press
        coordinate.press(forDuration: 1.0, thenDragTo: newCoordinate)

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3551692-press
        coordinate.press(forDuration: 1.0, thenDragTo: newCoordinate, withVelocity: .default, thenHoldForDuration: 1.0)

    }

    func testGestures() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]
        let coordinate = button.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3752782-swipeleft
        coordinate.referencedElement.swipeLeft()

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3752783-swipeleft
        coordinate.referencedElement.swipeLeft(velocity: .default)

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3752784-swiperight
        coordinate.referencedElement.swipeRight()

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3752785-swiperight
        coordinate.referencedElement.swipeRight(velocity: .default)

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3752786-swipeup
        coordinate.referencedElement.swipeUp()

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3752787-swipeup
        coordinate.referencedElement.swipeUp(velocity: .default)

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3752780-swipedown
        coordinate.referencedElement.swipeDown()

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/3752781-swipedown
        coordinate.referencedElement.swipeDown(velocity: .default)
    }

    func testRelativeCoordinates() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]
        let coordinate = button.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))

        // https://developer.apple.com/documentation/xctest/xcuicoordinate/1500913-withoffset
        print(coordinate.withOffset(CGVector(dx: 10.0, dy: 1.0)))
    }

}
