//
//  LearnGrouptingTestsIntoSubsteps.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 24/10/24.
//

import XCTest

final class LearnGrouptingTestsIntoSubsteps: XCTestCase {

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

    // https://developer.apple.com/documentation/xctest/activities_and_attachments/grouping_tests_into_substeps_with_activities

    func testlogin() {
        enterEmail()
        enterPassword()
    }

    func enterEmail() {
        // https://developer.apple.com/documentation/xctest/xctcontext
        // https://developer.apple.com/documentation/xctest/xctcontext/2923506-runactivity
        XCTContext.runActivity(named: "Enter_Email") { activity in
            print("Email Entered")
        }
    }

    func enterPassword() {
        XCTContext.runActivity(named: "Enter_Password") { activity in
            print("Password entered")
            // https://developer.apple.com/documentation/xctest/xctactivity
            let attachment: XCTAttachment = XCTAttachment(string: "Hello")
            // https://developer.apple.com/documentation/xctest/xctactivity/2887222-add
            activity.add(attachment)
            // https://developer.apple.com/documentation/xctest/xctactivity/2887219-name
            print(activity.name)
        }
    }



}
