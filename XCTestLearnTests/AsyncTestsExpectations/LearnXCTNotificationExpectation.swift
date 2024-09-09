//
//  LearnXCTNotificationExpectation.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 07/09/24.
//

import XCTest

final class LearnXCTNotificationExpectation: XCTestCase {

    let notificationName: Notification.Name = .init("My_Notification")
    let center: NotificationCenter = NotificationCenter.default
    let object = NotificationIgniter()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitializers() {
        // https://developer.apple.com/documentation/xctest/xctnsnotificationexpectation/2806827-init
        let expectation1 = XCTNSNotificationExpectation(name: notificationName)
        
        // https://developer.apple.com/documentation/xctest/xctnsnotificationexpectation/2806828-init
        let expectation2 = XCTNSNotificationExpectation(name: notificationName, object: object)
        
        // https://developer.apple.com/documentation/xctest/xctnsnotificationexpectation/2806830-init
        let expectation3 = XCTNSNotificationExpectation(name: notificationName, object: object, notificationCenter: center)
    }
    
    func testExpectationProperties() {
        let expectation = XCTNSNotificationExpectation(name: notificationName, object: object, notificationCenter: center)
        
        // https://developer.apple.com/documentation/xctest/xctnsnotificationexpectation/2806829-notificationname
        print(expectation.notificationName)
        
        // https://developer.apple.com/documentation/xctest/xctnsnotificationexpectation/2806831-observedobject
        print(expectation.observedObject)
        
        // https://developer.apple.com/documentation/xctest/xctnsnotificationexpectation/2806833-notificationcenter
        print(expectation.notificationCenter)
    }
    
    func testExpecationHandler() {
        let expectation = XCTNSNotificationExpectation(name: notificationName, object: object, notificationCenter: center)
        
        // https://developer.apple.com/documentation/xctest/xctnsnotificationexpectation/2806832-handler
        // https://developer.apple.com/documentation/xctest/xctnsnotificationexpectation/handler
        
        expectation.handler = { notification in
            // Add your own evalutation.
            return true
        }
    }
    
    func testExpectaionWorking() {
        let expectation = XCTNSNotificationExpectation(name: notificationName, object: object, notificationCenter: center)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {[weak self] in
            self?.object.igniteNotification()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    class NotificationIgniter {
        func igniteNotification() {
            NotificationCenter.default.post(name: .init("My_Notification"), object: self)
        }
    }
}
