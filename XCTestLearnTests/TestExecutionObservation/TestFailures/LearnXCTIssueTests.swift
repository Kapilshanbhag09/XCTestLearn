//
//  LearnXCTIssueTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 07/11/24.
//

import XCTest

final class LearnXCTIssueTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssert(false)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRecordMe() throws {
        let issue = XCTIssue(type: .assertionFailure, compactDescription: "My Test Issue")
        record(issue)
    }
    
    // https://developer.apple.com/documentation/xctest/xctissue/3566245-init
    func testInitializer() throws {
        let issue = XCTIssue(type: .assertionFailure,
                             compactDescription: "My New XCTIssue",
                             detailedDescription: "This is a sampled detailed descripion for my issue")
        record(issue)
    }
    
    override func record(_ issue: XCTIssue) {
        super.record(issue)
        var issue = issue
        
        // MARK: Issue details
        // https://developer.apple.com/documentation/xctest/xctissue/3566247-type
        print(issue.type)
        
        // https://developer.apple.com/documentation/xctest/xctissue/3566243-compactdescription
        print(issue.compactDescription)
        
        // https://developer.apple.com/documentation/xctest/xctissue/3566244-detaileddescription
        print(issue.detailedDescription)
        
        // https://developer.apple.com/documentation/xctest/xctissue/3566246-sourcecodecontext
        print(issue.sourceCodeContext)
        
        // https://developer.apple.com/documentation/xctest/xctissue/3566241-associatederror
        print(issue.associatedError)
        
        // https://developer.apple.com/documentation/xctest/xctissue/3566242-attachments
        print(issue.attachments)
        
        // https://developer.apple.com/documentation/xctest/xctissue/3566240-add
        issue.add(XCTAttachment(string: "Test"))
        
        // https://developer.apple.com/documentation/xctest/xctissue/3656328-hashvalue
        print(issue.hashValue)
        
        // https://developer.apple.com/documentation/xctest/xctissue/3656326-description
        print(issue.description)
        
        // https://developer.apple.com/documentation/xctest/xctissue/3656327-hash
        // Hash
        
        // Compare
        // https://developer.apple.com/documentation/xctest/xctissue/3566238
        // https://developer.apple.com/documentation/xctest/xctissue/3571349
    }

}
