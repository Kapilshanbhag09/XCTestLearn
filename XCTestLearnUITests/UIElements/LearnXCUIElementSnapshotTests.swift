//
//  LearnXCUIElementSnapshotTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 01/10/24.
//

import XCTest

final class LearnXCUIElementSnapshotTests: XCTestCase {

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

    func testSnapShot() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyAdd_Button"]

        let snapshot = try button.snapshot()

        print("Snapshot is")
        // https://developer.apple.com/documentation/xctest/xcuielementsnapshotproviding/3022452-snapshot
        print(snapshot)

        // https://developer.apple.com/documentation/xctest/xcuielementsnapshot/3022449-children
        print("Children")
        print(snapshot.children)

        // https://developer.apple.com/documentation/xctest/xcuielementsnapshot/3022450-dictionaryrepresentation
        print("Dictionary Representation")
        print(snapshot.dictionaryRepresentation)
    }
}
