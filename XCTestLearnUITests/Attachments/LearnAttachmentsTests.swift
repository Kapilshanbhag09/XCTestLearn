//
//  LearnAttachmentsTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 26/10/24.
//

import XCTest

final class LearnAttachmentsTests: XCTestCase {

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
    
    // Add using XCTActivity & XCTContext.
    func testAttachment() throws {
        XCTContext.runActivity(named: "My_Activity") { actvity in
            let app = XCUIApplication()
            app.launch()
            let _ = app.wait(for: .runningForeground, timeout: 5.0)
            
            let screenshot = app.screenshot()
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.lifetime = .keepAlways
            print(attachment.uniformTypeIdentifier)
            
            actvity.add(attachment)
            
        }
    }
    
    // Add attachment directly without context, activity
    // XCTestCase confirms to XCTActivity. So it given add(_:) method.
    func testAttachmentDirectly() throws {
        let app = XCUIApplication()
        app.launch()
        
        let _ = app.wait(for: .runningForeground, timeout: 5.0)
        
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        
        // Can also set lifetime to entire scheme in edit scheme.
        attachment.lifetime = .keepAlways
        
        self.add(attachment)
    }

}
