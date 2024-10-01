//
//  LearnXCUIElementAttributesTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 01/10/24.
//

import XCTest

final class LearnXCUIElementAttributesTests: XCTestCase {

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

    func testIdentity() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500981-identifier
        print("Identifier " + button.identifier)

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500614-elementtype
        print(button.elementType.rawValue)

        // https://developer.apple.com/documentation/xctest/xcuielement/elementtype
    }

    func testValue() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1501015-value
        print(button.value)

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500388-placeholdervalue
        print(button.placeholderValue)

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500509-title
        print("Title: " + button.title)

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500692-label
        print("Label " + button.label)
    }

    func testInteractionState() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1627636-hasfocus
        print(button.hasFocus)

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500330-isenabled
        print(button.isEnabled)

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500581-isselected
        print(button.isSelected)
    }

    func testSize() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500911-frame
        print(button.frame)

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500681-horizontalsizeclass
        print(button.horizontalSizeClass)

        // https://developer.apple.com/documentation/xctest/xcuielementattributes/1500586-verticalsizeclass
        print(button.verticalSizeClass)

        // https://developer.apple.com/documentation/xctest/xcuielement/sizeclass
        print("Horizontal Size Class", terminator: ":")
        switch button.horizontalSizeClass {
            // https://developer.apple.com/documentation/xctest/xcuielement/sizeclass/regular
        case .regular: print("Regular")
            // https://developer.apple.com/documentation/xctest/xcuielement/sizeclass/compact
        case .compact: print("Compact")
            // https://developer.apple.com/documentation/xctest/xcuielement/sizeclass/unspecified
        case .unspecified: print("Unspecified")
        @unknown default:
            print("")
        }

        print("Vertical Size Class", terminator: ":")
        switch button.verticalSizeClass {
        case .regular: print("Regular")
        case .compact: print("Compact")
        case .unspecified: print("Unspecified")
        @unknown default:
            print("")
        }
    }

}
