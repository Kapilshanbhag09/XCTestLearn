//
//  LearnXCTTestRunTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 11/11/24.
//

import XCTest

final class MyTests: XCTestCase {
    func testSomthing() throws {
        print("Error")
        XCTAssert(false)
    }
}

final class LearnXCTTestRunTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
//        let testRun = XCTestRun(test: MyTests())
//        testRun.start()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


    func testInitializer() {
        // // https://developer.apple.com/documentation/xctest/xctestrun/1449642-init
        let testRun = XCTestRun(test: MyTests())
        
        // https://developer.apple.com/documentation/xctest/xctestrun/1449649-start
        self.testRun?.start()
        // https://developer.apple.com/documentation/xctest/xctestrun/1449650-stop
        self.testRun?.stop()
        // https://developer.apple.com/documentation/xctest/xctestrun/3546553-record
        self.testRun?.record(XCTIssue(type: .performanceRegression, compactDescription: "T"))
    }

    func testDurations() {

    }


    override func tearDown() {
        print("Date")
        // https://developer.apple.com/documentation/xctest/xctestrun/1449646-startdate
        print(self.testRun?.startDate)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449648-stopdate
        print(self.testRun?.stopDate)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449635-testduration
        print(self.testRun?.testDuration)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449652-totalduration
        print(self.testRun?.totalDuration)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449631-hassucceeded
        print(self.testRun?.hasSucceeded)

        // https://developer.apple.com/documentation/xctest/xctestrun/3521152-hasbeenskipped
        print(self.testRun?.hasBeenSkipped)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449644-executioncount
        print(self.testRun?.executionCount)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449629-failurecount
        print(self.testRun?.failureCount)

        // https://developer.apple.com/documentation/xctest/xctestrun/3521153-skipcount
        print(self.testRun?.skipCount)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449637-test
        print(self.testRun?.test)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449655-testcasecount
        print(self.testRun?.testCaseCount)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449657-totalfailurecount
        print(self.testRun?.totalFailureCount)

        // https://developer.apple.com/documentation/xctest/xctestrun/1449634-unexpectedexceptioncount
        print(self.testRun?.unexpectedExceptionCount)
    }

}
