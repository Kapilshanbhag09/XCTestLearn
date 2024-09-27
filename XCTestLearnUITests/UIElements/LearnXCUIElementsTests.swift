//
//  LearnXCUIElementsTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 25/09/24.
//

import XCTest

final class LearnXCUIElementsTests: XCTestCase {

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
    
    func testElementState() throws {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let buttonElement = app.buttons["MyAdd_Button"]
        
        // https://developer.apple.com/documentation/xctest/xcuielement/2879412-waitforexistence
        print(buttonElement.waitForExistence(timeout: 1.0))
        
        // https://developer.apple.com/documentation/xctest/xcuielement/4391535-waitfornonexistence
//        print(buttonElement.waitForNonExistence(timeout: 1.0))
        
        // https://developer.apple.com/documentation/xctest/xcuielement/4395161-wait
//        func wait<V>(
//            for keyPath: KeyPath<XCUIElement, V>,
//            toEqual expectedValue: V,
//            timeout: TimeInterval
//        ) -> Bool where V : Equatable
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1500760-exists
        print(buttonElement.exists)
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1500561-ishittable
        print(buttonElement.isHittable)
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1500909-debugdescription
        print(buttonElement.debugDescription)
    }
    
    func testElementQuerying() throws {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let buttonElement = app.buttons["MyAdd_Button"]
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1500877-children
        buttonElement.children(matching: .button)
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1500791-descendants
        buttonElement.descendants(matching: .button)
    }
    
    // https://developer.apple.com/documentation/xctest/xcuielement/1500968-typetext
    func testTypingText() throws {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let textFieldElement = app.textFields["MyText_Field"]
        textFieldElement.tap()
        
        textFieldElement.typeText("Hello")
    }
    
    func testKeyStroke() throws {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let textFieldElement = app.textFields["MyText_Field"]
        textFieldElement.tap()
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1500604-typekey
        textFieldElement.typeKey("h", modifierFlags: .shift)
        textFieldElement.typeKey("e", modifierFlags: .shift)
        
        // https://developer.apple.com/documentation/xctest/xcuielement/2920413-typekey
        // Only for Mac
        //        textFieldElement.typeKey(.shift, modifierFlags: .option)
        
        // https://developer.apple.com/documentation/xctest/xcuikeyboardkey
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1500563-perform
        XCUIElement.perform(withKeyModifiers: .capsLock) {
            textFieldElement.typeText("Hi")
        }
        
        // https://developer.apple.com/documentation/xctest/xcuielement/keymodifierflags
    }
    
    // https://developer.apple.com/documentation/xctest/xcuielement/1500437-hover
    func testHover() {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let textFieldElement = app.textFields["MyText_Field"]
        textFieldElement.hover()
    }
    
    func testClick() {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let textFieldElement = app.textFields["MyText_Field"]
        textFieldElement.click()
    }
    
    func testTapAndPress() {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let textFieldElement = app.textFields["MyText_Field"]
        // https://developer.apple.com/documentation/xctest/xcuielement/1618666-tap
//        textFieldElement.tap()
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1618673-doubletap
//        textFieldElement.doubleTap()
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1618663-press
//        textFieldElement.press(forDuration: 5.0)
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1618670-press
//        textFieldElement.press(forDuration: 2.0, thenDragTo: app.buttons["MyAdd_Button"])
        
        // https://developer.apple.com/documentation/xctest/xcuielement/3551693-press
        textFieldElement.press(forDuration: 2.0,
                               thenDragTo: app.buttons["MyAdd_Button"],
                               withVelocity: .default,
                               thenHoldForDuration: 1.0)
    }
    
    func testMultipleFingerTap() {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let textFieldElement = app.textFields["MyText_Field"]
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1618675-twofingertap
//        textFieldElement.twoFingerTap()
        
        // https://developer.apple.com/documentation/xctest/xcuielement/1618671-tap
        textFieldElement.tap(withNumberOfTaps: 1, numberOfTouches: 1)
    }
    
    func testSwipeGestures() {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let textFieldElement = app.textFields["MyText_Field"]
        textFieldElement.tap()
        textFieldElement.typeText("Hello")
        // https://developer.apple.com/documentation/xctest/xcuielement/1618668-swipeleft
//        textFieldElement.swipeLeft()
        // https://developer.apple.com/documentation/xctest/xcuielement/3551695-swipeleft
        textFieldElement.swipeLeft(velocity: XCUIGestureVelocity(integerLiteral: 30))
        
        // https://developer.apple.com/documentation/xctest/xcuigesturevelocity
    }
    
    // https://developer.apple.com/documentation/xctest/xcuielement/1500960-coordinate
    func testCoordinate() {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let textFieldElement = app.textFields["MyText_Field"]
        print(textFieldElement.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0)))
        
        
    }
    
    // https://developer.apple.com/documentation/xctest/xcuielement/1500373-normalizedsliderposition
    /// slider changes
    // https://developer.apple.com/documentation/xctest/xcuielement/1618672-adjust
    /// Adjust picker value.
    
    // https://developer.apple.com/documentation/xctest/xcuielement/sizeclass
    func testSizeClass() {
        let app = XCUIApplication()
        app.launch()
        guard app.wait(for: .runningForeground, timeout: 5.0) else {return}
        
        let textFieldElement = app.textFields["MyText_Field"]
        print(textFieldElement.verticalSizeClass.rawValue)
    }
    // https://developer.apple.com/documentation/xctest/xcuielement/elementtype
    // https://developer.apple.com/documentation/xctest/xcuielement/attributename
}
