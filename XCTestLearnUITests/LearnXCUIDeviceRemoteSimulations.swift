//
//  LearnXCUIDeviceRemoteSimulations.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 05/10/24.
//

import XCTest

final class LearnXCUIDeviceRemoteSimulations: XCTestCase {

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

    func testAccessingCurrentDevice() throws {
        let app = XCUIApplication()
        app.launch()

        // https://developer.apple.com/documentation/xctest/xcuidevice/1619048-shared
        // https://developer.apple.com/documentation/xctest/xcuidevice/3792284-supportspointerinteraction
        print(XCUIDevice.shared.supportsPointerInteraction)

        // https://developer.apple.com/documentation/xctest/xcuidevice/4337510-supportshandgestures
        // XCode 16+
//        print(XCUIDevice.shared.supportsHandGestures)
    }

    func testInteractingWithButton() throws {
        let app = XCUIApplication()
        app.launch()

        // https://developer.apple.com/documentation/xctest/xcuidevice/1619052-press
        XCUIDevice.shared.press(.home)

        // https://developer.apple.com/documentation/xctest/xcuidevice/4084182-hashardwarebutton
        print(XCUIDevice.shared.hasHardwareButton(.home))

        // https://developer.apple.com/documentation/xctest/xcuidevice/button
        let button: XCUIDevice.Button = .action

        switch button {
        // https://developer.apple.com/documentation/xctest/xcuidevice/button/home
        case .home: break
        // https://developer.apple.com/documentation/xctest/xcuidevice/button/action
        case .action: break
        #if targetEnvironment(simulator)
        #else
        // https://developer.apple.com/documentation/xctest/xcuidevice/button/volumedown
        case .volumeDown: break
        // https://developer.apple.com/documentation/xctest/xcuidevice/button/volumeup
        case .volumeUp: break
        #endif
        }

        #if TARGET_OS_WATCH
        // https://developer.apple.com/documentation/xctest/xcuidevice/3784679-rotatedigitalcrown
        XCUIDevice.shared.rotateDigitalCrown(delta: 1.0)

        // https://developer.apple.com/documentation/xctest/xcuidevice/3784680-rotatedigitalcrown
        XCUIDevice.shared.rotateDigitalCrown(delta: 1.0, velocity: 1.0)
        #endif
    }

    func testPerormingGestures() throws {
        // XCode 16 & >
        // https://developer.apple.com/documentation/xctest/xcuidevicehandgesture
        // https://developer.apple.com/documentation/xctest/xcuidevicehandgesture/doubletap
//        XCUIDevice.shared.perform(handGesture: .doubleTap)
    }

    func testRotatingAndChangingLocation() throws {
        // https://developer.apple.com/documentation/xctest/xcuidevice/1619046-orientation
        XCUIDevice.shared.orientation = .portrait

        // https://developer.apple.com/documentation/xctest/xcuidevice/4111083-location
        print(XCUIDevice.shared.location)

        // https://developer.apple.com/documentation/xctest/xcuilocation
        let location = XCUIDevice.shared.location
        // https://developer.apple.com/documentation/xctest/xcuilocation/4111087-location
//        print(location?.location)
        // https://developer.apple.com/documentation/xctest/xcuilocation/4111085-debugdescription
        print(location?.debugDescription)
    }

    func testInteractingWithOS() throws {
        // https://developer.apple.com/documentation/xctest/xcuidevice/4108228-system
        print(XCUIDevice.shared.system)

        // https://developer.apple.com/documentation/xctest/xcuidevice/4108227-appearance
        XCUIDevice.shared.appearance = .dark

        switch XCUIDevice.shared.appearance {
        case .unspecified:
            // https://developer.apple.com/documentation/xctest/xcuidevice/appearance/unspecified
            break
        case .light:
            // https://developer.apple.com/documentation/xctest/xcuidevice/appearance/light
            break
        case .dark:
            // https://developer.apple.com/documentation/xctest/xcuidevice/appearance/dark
            break
        }
    }

    func testInteractingWithSiri() throws {
        // https://developer.apple.com/documentation/xctest/xcuidevice/2852144-siriservice
        print(XCUIDevice.shared.siriService)
    }

    func testXCUISystem() throws {
        let app = XCUIApplication()
        app.launch()

        // https://developer.apple.com/documentation/xctest/xcuisystem
        // https://developer.apple.com/documentation/xctest/xcuisystem/4108234-open
        XCUIDevice.shared.system.open(URL(string: "https://google.com")!)
    }

    func testXCUISiriService() throws {
        let app = XCUIApplication()
        app.launch()

        let siriService = XCUIDevice.shared.siriService

        // https://developer.apple.com/documentation/xctest/xcuisiriservice
        // https://developer.apple.com/documentation/xctest/xcuisiriservice/2852140-activate
        siriService.activate(voiceRecognitionText: "Who is Kapil Shanbhag")
        // https://developer.apple.com/documentation/xctest/xcuisiriservice/2852141-debugdescription
        print(siriService.debugDescription)
    }

    func testXCUIRemoteControl() throws {
#if TARGET_OS_TV
        // https://developer.apple.com/documentation/xctest/xcuiremote
        let app = XCUIApplication()
        app.launch()

        // https://developer.apple.com/documentation/xctest/xcuiremote/1627480-shared
        let shared = XCUIRemote.shared

        // https://developer.apple.com/documentation/xctest/xcuiremote/1627476-press
        shared.press(.down)

        // https://developer.apple.com/documentation/xctest/xcuiremote/1627475-press
        shared.press(.down, forDuration: 1.0)

        // https://developer.apple.com/documentation/xctest/xcuiremotebutton
        switch XCUIRemoteButton {
        case .up : break
        case .down : break
        case .left : break
        case .right : break
        case .select : break
        case .menu : break
        case .playPause : break
        case .home : break
        case .pageUp : break
        case .pageDown : break
        case .guide : break
        }
#endif
    }
}
