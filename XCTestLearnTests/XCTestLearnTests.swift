//
//  XCTestLearnTests.swift
//  XCTestLearnTests
//
//  Created by Kapil Shanbhag on 28/05/24.
//

import XCTest
@testable import XCTestLearn

final class XCTestLearnTests: XCTestCase {

    //MARK: class func setUp(): 1
    // Called first. Use to set up state common to all test methods.
    override class func setUp() {
        super.setUp()
        print("class func setUp() called")
    }
    
    
    
    //MARK: setUp(completion: )
    // Called before every test method start.
    // Handle the states asynchronously & handle error before calling each test methods.
    // Dont override this as suggested by Apple document, but override the secone method
    override func setUp(completion: @escaping (Error?) -> Void) {
        super.setUp(completion: completion)
        print("Called setUp() async method")
    }
    // Or
//    override func setUp() async throws {
//    }
    
    //MARK: setUpWithError()
    // Called after above method.
    // Reset states & also throw error before calling each test methods.
    override func setUpWithError() throws {
        try super.setUpWithError()
        print("I am called setUpWithError")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    // MARK: setUp()
    // Called after above method
    // Reset states before calling each test methods.
    override func setUp() {
        super.setUp()
        print("Set up made")
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
        let expectation = XCTestExpectation(description: "Time for the fullfillment")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }
        
        addTeardownBlock {
            print("I am first Teardown")
        }
        
        wait(for: [expectation], timeout: 2.0)
        
        addTeardownBlock {
            print("I am second Teardown")
        }
        
        addTeardownBlock {
            print("I am third Teardown")
        }
        
    }
    
    func testIsEvenMethod() throws {
        print("testIsEvenMethod called")
    }
    
    //MARK: tearDown()
    // Perform clean up action
    // Called after each method has ended its execution.
    override func tearDown() {
        super.tearDown()
        print("Tear down")
    }
    
    //MARK: tearDownWithError()
    // Called after above method
    // Perform clean up and also throw error after each test method ends.
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        print("Teardown with Error called")
    }
    
    //MARK: tearDown(completion:)
    // Called after above method
    // Perform clean up asynchronously and also throw error after each test method ends.
    // Dont override this as suggested by Apple document, but override the secone method.
    override func tearDown(completion: @escaping (Error?) -> Void) {
        super.tearDown(completion: completion)
        print("Teardown with Completion")
    } // Or
//    override func tearDown() async throws {
//        super.tearDown()
//    }
}
