//
//  LearnXCUIApplicationTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 24/09/24.
//

import XCTest

final class LearnXCUIApplicationTests: XCTestCase {

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
    }

    func testInit() throws {
        // https://developer.apple.com/documentation/xctest/xcuiapplication/2879414-init
//        let app = XCUIApplication()

        // https://developer.apple.com/documentation/xctest/xcuiapplication/2879415-init
        // Open using bundle Identifier.
        let app1 = XCUIApplication(bundleIdentifier: "kapil.shanbhag.XCTestLearn")

        // https://developer.apple.com/documentation/xctest/xcuiapplication/2879413-init
        // Only for Mac.
//        let app2 = XCUIApplication(url: "http://myURL.com")
    }

    func testLaunch() throws {
        let app = XCUIApplication()

        // https://developer.apple.com/documentation/xctest/xcuiapplication/1500467-launch
        app.launch()

        // https://developer.apple.com/documentation/xctest/xcuiapplication/1500477-launcharguments
        app.launchArguments = ["Hello"]

        // https://developer.apple.com/documentation/xctest/xcuiapplication/1500427-launchenvironment
        app.launchEnvironment = ["a":"Apple"]

        // https://developer.apple.com/documentation/xctest/xcuiapplication/4108226-open
        app.open(URL(string: "https://int.com")!)
    }

    func testAppActivate() throws {
        let app = XCUIApplication()

        // https://developer.apple.com/documentation/xctest/xcuiapplication/2873317-activate
        /// Synchronous call.
        /// If app was not running before, it will be launched.
        /// Will not terminate existing instance of app.
        /// Any failure will lead to test failure.
        app.activate()
    }

    func testAppTerminate() throws {
        let app = XCUIApplication()

        app.activate()

        // https://developer.apple.com/documentation/xctest/xcuiapplication/1500637-terminate
        app.terminate()
    }

    func testStates() throws {
        let app = XCUIApplication()

        // https://developer.apple.com/documentation/xctest/xcuiapplication/2877401-state
        print(app.state.rawValue)

        app.launch()
        print(app.state.rawValue)

        app.terminate()
        print(app.state.rawValue)

        switch app.state {
            // https://developer.apple.com/documentation/xctest/xcuiapplication/state/unknown
        case .unknown: break
            // https://developer.apple.com/documentation/xctest/xcuiapplication/state/notrunning
        case .notRunning: break
            // https://developer.apple.com/documentation/xctest/xcuiapplication/state/runningbackgroundsuspended
        case .runningBackgroundSuspended: break
            // https://developer.apple.com/documentation/xctest/xcuiapplication/state/runningbackground
        case .runningBackground: break
            // https://developer.apple.com/documentation/xctest/xcuiapplication/state/runningforeground
        case .runningForeground: break
        @unknown default:
            break
        }
    }

    // https://developer.apple.com/documentation/xctest/xcuiapplication/2921487-wait
    func testWaitForState() throws {
        let app = XCUIApplication()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            app.launch()
        }
        let possibile = app.wait(for: .runningForeground, timeout: 1.0)
        print(possibile)
    }

    func testResetAuthorizationStatus() throws {
        let app = XCUIApplication()
        // https://developer.apple.com/documentation/xctest/xcuiapplication/3526066-resetauthorizationstatus
        app.resetAuthorizationStatus(for: .camera)

        // https://developer.apple.com/documentation/xctest/xcuiprotectedresource
        /// Protected Resource
    }

    func testAccessibilitAudit() throws {
        let app = XCUIApplication()
        app.launch()

        // https://developer.apple.com/documentation/xctest/xcuiapplication/4191487-performaccessibilityaudit
//        try app.performAccessibilityAudit()

        // https://developer.apple.com/documentation/xctest/xcuiaccessibilityaudittype
//        try app.performAccessibilityAudit(for: .all)

        // https://developer.apple.com/documentation/xctest/xcuiaccessibilityauditissue
        /// Checks the type of accessibility supported.
        try app.performAccessibilityAudit() { auditIssue in
            print("Audit Issue")
            // https://developer.apple.com/documentation/xctest/xcuiaccessibilityauditissue/4190834-audittype
            print(auditIssue.auditType)
            // https://developer.apple.com/documentation/xctest/xcuiaccessibilityauditissue/4190835-compactdescription
            print(auditIssue.compactDescription)
            // https://developer.apple.com/documentation/xctest/xcuiaccessibilityauditissue/4190836-detaileddescription
            print(auditIssue.detailedDescription)
            // https://developer.apple.com/documentation/xctest/xcuiaccessibilityauditissue/4190837-element
            print(auditIssue.element)
            return true
        }
    }
}
