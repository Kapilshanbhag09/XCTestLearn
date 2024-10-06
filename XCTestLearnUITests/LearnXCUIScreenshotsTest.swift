//
//  LearnXCUIScreenshotsTest.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 05/10/24.
//

import XCTest

final class LearnXCUIScreenshotsTest: XCTestCase {

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

    //MARK: XCUIScreen
    // https://developer.apple.com/documentation/xctest/xcuiscreen
    func testScreens() throws {
        let app = XCUIApplication()
        app.launch()

        // https://developer.apple.com/documentation/xctest/xcuiscreen/2896939-main
        print(XCUIScreen.main)

        // https://developer.apple.com/documentation/xctest/xcuiscreen/2896937-screens
        print(XCUIScreen.screens)
    }

    //MARK: XCUIScreenshot
    // https://developer.apple.com/documentation/xctest/xcuiscreenshot
    func testScreenshot() throws {
        let app = XCUIApplication()
        app.launch()

        // https://developer.apple.com/documentation/xctest/xcuiscreenshot/2897658-image
        print(app.screenshot().image)

        // https://developer.apple.com/documentation/xctest/xcuiscreenshot/2897660-pngrepresentation
        print(app.screenshot().pngRepresentation)
    }

    func testScreenshotProviding() throws {
        let app = XCUIApplication()
        app.launch()

        // https://developer.apple.com/documentation/xctest/xcuiscreenshotproviding

        // https://developer.apple.com/documentation/xctest/xcuiscreenshotproviding/2897250-screenshot
        print(app.screenshot())
    }
}
