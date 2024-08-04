//
//  LearnExpectedFailuresTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 03/08/24.
//

import XCTest

final class LearnExpectedFailuresTests: XCTestCase {

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
    
    func testExpectedFailure() throws {
        let thingThatFails: Bool = false
        XCTExpectFailure("Working on a fix for this problem.")
        XCTAssertTrue(thingThatFails, "This is not working right now.")
    }
    
    // MARK: XCTExpectFailure Methods()
    // https://developer.apple.com/documentation/xctest/3727245-xctexpectfailure
    func testExpectFailureMethod1() throws {
        let thingThatFails: Bool = false
        
        XCTExpectFailure("Working on fix") // options is default parameter.
        XCTAssertTrue(thingThatFails, "This is not working right now.")
    }
    
    // https://developer.apple.com/documentation/xctest/3784635-xctexpectfailure
    func testExpectFailureMethod2() throws {
        let thingThatFails: Bool = false
        
        /// if enabled is true: Our test doesnt throw error.
        /// If enabled is false: Our test throws error.
        ///
        ///Lets comment Line XCTAssertTrue.
        /// if strict is true: Our test throws an error.
        /// If strict is false: Our test doenst throw an error.
        ///
        /// issueMatcher: A closure to tell wether the given issue types satifies the Expect Failure.
        XCTExpectFailure("Working on fix", enabled: true, strict: true) { issue in
            return issue.type == .assertionFailure ? true : false
        }
        
        XCTAssertTrue(thingThatFails, "This is not working right now.")
    }
    
    // https://developer.apple.com/documentation/xctest/3727246-xctexpectfailure
    func testExpectFailureMethod3() throws {
        let options: XCTExpectedFailure.Options = XCTExpectedFailure.Options()
        XCTExpectFailure("Working on fix", options: options) {
            XCTAssertTrue(false)
            
            // NOTE: Return type of cloure will be return type of the XCTExpectFailure.
        }
    }
    
    // https://developer.apple.com/documentation/xctest/3784634-xctexpectfailure
    func testExpectFailureMethod4() throws {
        XCTExpectFailure(enabled: true, strict: true, failingBlock: {
            XCTAssertTrue(false)
        }) { issue in
            return true
        }
        // NOTE: Return type of cloure will be return type of the XCTExpectFailure.
    }
    
    // MARK: ExpectedFailure.Options
    func testExpectFailureOptions() throws {
        let options = XCTExpectedFailure.Options()
        
        // https://developer.apple.com/documentation/xctest/xctexpectedfailure/options/3726086-issuematcher
        options.issueMatcher = { error in
            return true
        }
        
        // https://developer.apple.com/documentation/xctest/xctexpectedfailure/options/3726085-isenabled
        options.isEnabled = true
        
        // https://developer.apple.com/documentation/xctest/xctexpectedfailure/options/3726087-isstrict
        options.isStrict = true
        
        // https://developer.apple.com/documentation/xctest/xctexpectedfailure/options/3784636-nonstrict
        // Returns a non strict option.
        let myNonStrictOption = XCTExpectedFailure.Options.nonStrict()
    }
}


// Question 1.
// Player A and B are Playing a game. There are N balls in table. Each Player had to pick 1 or 2 balls alternatively. The player who has no balls to pick is the loser of the game.
// A always picks the last ball. Our objective is to check wether A wins or loses the game.

// Given N number of balls, Tell wether A wins the game or not.
// Input: n: Int, Output: Bool (wether A wins or not).

//Question 2.
// There is a wordlist which contain a list of words. There is a searchWord string. You have to check if the searchWord is present in wordlist. If present return the word, if not return the longest common suffix
// Eg.
// Input: wordList: [String], searchWord: String, Output: String.
// wordList = ["abcd", "abce"] searchWord = "abc" -> "abc"
// wordList = ["abed", "ab"] searchWord = "abc" -> "ab"
