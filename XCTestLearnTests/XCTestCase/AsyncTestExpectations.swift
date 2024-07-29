//
//  AsyncTestExpectations.swift
//  XCTestLearnTests
//
//  Created by Kapil Shanbhag on 23/07/24.
//

import Foundation
import XCTest

@testable import XCTestLearn

class AsyncTestExpectationsTests: XCTestCase {
    
    
    func testSampleExpectationAndWait() {
        let expectation = XCTestExpectation(description: "Wait for the Dispatch Queue async")
        let timeOfCompletion: DispatchTime = .now() + 1.0
        DispatchQueue.main.asyncAfter(deadline: timeOfCompletion) {
            expectation.fulfill() // fullfill => says expectation that the wait has been completed.
        } // Async function that completes after timeOfCompletion time
        wait(for: [expectation], timeout: 1.0) // wait() waits for expextation to fullfill.
    }
    
    func testSampleExpectationMethods() {
        // https://developer.apple.com/documentation/xctest/xctestcase/1500899-expectation
        // let expectation1 = expectation(description: "Expectation 1") // Function return XCTestExpectation.
        
        // https://developer.apple.com/documentation/xctest/xctestcase/1500569-expectation
        // TODO: Need to learn about predate
        //        let a = 10
        //        let expectation2 = expectation(for: NSPredicate(format: "a==10", argumentArray: []), evaluatedWith: a, handler: {
        //                return true
        //            }
        //        )
        
        // https://developer.apple.com/documentation/xctest/xctestcase/1500964-expectation
        
        //Create notification
        let notificationName = NSNotification.Name(rawValue: "MyNotification")
        let notification = NSNotification(name: notificationName, object: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            NotificationCenter.default.post(name: notificationName, object: 10) // Post Notification asynchronously.
        }
        
        let expectation3 = expectation(forNotification: notificationName, object: nil, handler: { notification in
            return true // My custom evaluation
        }) // expectation waits for notification.
        
        // https://developer.apple.com/documentation/xctest/xctestcase/3042655-expectation
        let expectation4 = expectation(forNotification: notificationName, object: nil, notificationCenter: NotificationCenter.default) {notification in
            return true
        } // expectation watis for notication on a mentioned NotificationCenter
        
        
        //Key Value observing Notification.
        // https://developer.apple.com/documentation/xctest/xctestcase/1500612-keyvalueobservingexpectation
        let myStruct =MyStruct()
        let expectation5 = keyValueObservingExpectation(for: myStruct, keyPath: "a", expectedValue: 10)

        wait(for: [expectation5])

        // https://developer.apple.com/documentation/xctest/xctestcase/1500318-keyvalueobservingexpectation
        let expectation6 =  keyValueObservingExpectation(for: myStruct, KeyPath: "a") {
            return true
        }

        // https://developer.apple.com/documentation/xctest/xctestcase/3991294-expectation
        let keyPath: KeyPath = \MyStruct.a
        let t = MyStruct()
        let expectation7 = expectation(that: keyPath, on: t, willEqual: 10)
    }

    func testExpectation() {
        
    }
    
    struct MyStruct {
        var a: Int = 10
    }
}
