//
//  LearnSkippingMethodTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 04/08/24.
//

import XCTest

final class LearnSkippingMethodTests: XCTestCase {

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
    
    func testMethodsSkipping() throws {
        // https://developer.apple.com/documentation/xctest/3521325-xctskipif
        // try XCTSkipIf(false)
        
        // https://developer.apple.com/documentation/xctest/3521326-xctskipunless
//        try XCTSkipUnless(false)
        
        
        
        XCTAssert(false)
    }
    
    func testXCTSkip() throws {
        // https://developer.apple.com/documentation/xctest/xctskip/3727247-init
        /// Initializer.
        let xctSkip = XCTSkip("My skip")
        
        print(xctSkip.errorCode)
        
        // https://developer.apple.com/documentation/xctest/xctskip/3521321-erroruserinfo
        print(xctSkip.errorUserInfo)
        
        // https://developer.apple.com/documentation/xctest/xctskip/3521323-localizeddescription
        print(xctSkip.localizedDescription)
        
        // https://developer.apple.com/documentation/xctest/xctskip/3521324-message
        print(xctSkip.message)
        
        // https://developer.apple.com/documentation/xctest/xctskip/3521319-errordomain
        // https://developer.apple.com/documentation/xctest/xctskip/3521320-errordomain
        print(XCTSkip.errorDomain)
        
        throw xctSkip
    }

}
