//
//  LearnXCUIElementQuery.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 17/09/24.
//

import XCTest

final class LearnXCUIElementQuery: XCTestCase {

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
        
        let button = app.buttons["MyAdd_Button"]
        let query = button.children(matching: .button)
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1501006-children
        print(query.children(matching: .button))
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500659-descendants
        print(query.descendants(matching: .button))
//        XCTAssertTrue(button.exists)
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500956-containing
//        print(query.containing(NSPredicate()))
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500995-containing
        print(query.containing(.button, identifier: "MyAdd_Button"))
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500679-matching
        print(query.matching(identifier: "MyAdd_Button"))
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500471-matching
//        print(query.matching(NSPredicate()))
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500881-matching
        print(query.matching(.button, identifier: "MyAdd_Button"))
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testAccessingMatchedElements() {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["MyAdd_Button"]
        let query = button.children(matching: .button)
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500816-allelementsboundbyaccessibilitye
        print(query.allElementsBoundByAccessibilityElement)
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500945-allelementsboundbyindex
        print(query.allElementsBoundByIndex)
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500625-count
        print(query.count)
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500515-element
        print(query.element)
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500842-element
        print(query.element(boundBy: 0))
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500768-element
//        print(query.element(matching: NSPredicate()))
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500715-element
        print(query.element(matching: .button, identifier: "MyAdd_Button"))
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500776-subscript
        print(query["MyAdd_Button"])
    }
    
    func testDebugDescription() {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["MyAdd_Button"]
        let query = button.children(matching: .button)
        
        // https://developer.apple.com/documentation/xctest/xcuielementquery/1500412-debugdescription
        print(query.debugDescription)
    }
    
    func testWindowButtonIdentifier() {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["MyAdd_Button"]
        let query = button.children(matching: .button)
        
        // https://developer.apple.com/documentation/xctest/xcuiidentifierclosewindow
        print(XCUIIdentifierCloseWindow)
        // https://developer.apple.com/documentation/xctest/xcuiidentifierfullscreenwindow
        print(XCUIIdentifierFullScreenWindow)
        // https://developer.apple.com/documentation/xctest/xcuiidentifierminimizewindow
        print(XCUIIdentifierMinimizeWindow)
        // https://developer.apple.com/documentation/xctest/xcuiidentifierzoomwindow
        print(XCUIIdentifierZoomWindow)
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
