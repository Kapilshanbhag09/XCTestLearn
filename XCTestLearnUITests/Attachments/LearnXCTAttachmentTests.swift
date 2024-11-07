//
//  LearnXCTAttachmentTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 26/10/24.
//

import XCTest

final class LearnXCTAttachmentTests: XCTestCase {
    
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
    
    // MARK: Data.
    // https://developer.apple.com/documentation/xctest/xctattachment/2887208-init
    func testInitializer1() throws {
        let myData = ["Kapil" : "1"]
        let data = try JSONSerialization.data(withJSONObject: myData)
        
        let attachment = XCTAttachment(data: data)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    // https://developer.apple.com/documentation/xctest/xctattachment/2887206-init
    func testInitializer2() throws {
        let myData = ["Kapil" : "1"]
        let data = try JSONSerialization.data(withJSONObject: myData)
        
        let attachment = XCTAttachment(data: data, uniformTypeIdentifier: "MyData")
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    // https://developer.apple.com/documentation/xctest/xctattachment/2887221-init
    func testInitializer3() throws {
        let myData = ["Kapil" : "1"]
        let data = try JSONSerialization.data(withJSONObject: myData)
        
        let attachment = XCTAttachment(uniformTypeIdentifier: nil, name: "My Data", payload: data, userInfo: ["a" : 1])
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    // MARK: Files And Folders
    // https://developer.apple.com/documentation/xctest/xctattachment/2887207-init
    func testFilesInitializer1() throws {
        let url = URL(filePath: "Users/kapilshanbhag/iOS/XCTest/XCTestLearn/XCTestLearn/AppDelegate.swift")
        let attachment = XCTAttachment(contentsOfFile: url)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    // https://developer.apple.com/documentation/xctest/xctattachment/2887203-init
    func testFilesInitializer2() throws {
        let url = URL(filePath: "Users/kapilshanbhag/iOS/XCTest/XCTestLearn/XCTestLearn/AppDelegate.swift")
        let attachment = XCTAttachment(contentsOfFile: url, uniformTypeIdentifier: "MyFile")
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    // Available only in macOS
    // https://developer.apple.com/documentation/xctest/xctattachment/2887210-init
    func testFilesInitializer3() throws {
        if #available(macOS 12, *) {
            //            let url = URL(filePath: "/XCTesLearn/AppDelegate.swift")
            //            let attachment = XCTAttachment(compressedContentsOfDirectory: url)
            //            attachment.lifetime = .keepAlways
            //            add(attachment)
        }
    }
    
    // MARK: Images & Screenshots
    // https://developer.apple.com/documentation/xctest/xctattachment/2887224-init
    func testImagesScreenshotInitializer1() throws {
        let app = XCUIApplication()
        app.launch()
        
        let screenshot = app.screenshot()
        
        let image = screenshot.image
        
        let attachment = XCTAttachment(image: image)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    // https://developer.apple.com/documentation/xctest/xctattachment/2897397-init
    func testImagesScreenshotInitializer2() throws {
        let app = XCUIApplication()
        app.launch()
        
        let screenshot = app.screenshot()
        
        let image = screenshot.image
        
        let attachment = XCTAttachment(image: image, quality: .low)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    // https://developer.apple.com/documentation/xctest/xctattachment/2897395-init
    func testImagesScreenshotInitializer3() throws {
        let app = XCUIApplication()
        app.launch()
        
        let screenshot = app.screenshot()
        
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    // https://developer.apple.com/documentation/xctest/xctattachment/2897400-init
    func testImagesScreenshotInitializer4() throws {
        let app = XCUIApplication()
        app.launch()
        
        let screenshot = app.screenshot()
        
        let attachment = XCTAttachment(screenshot: screenshot, quality: .original)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testImageQuality() throws {
        // https://developer.apple.com/documentation/xctest/xctattachment/imagequality
        let app = XCUIApplication()
        app.launch()
        
        let screenshot = app.screenshot()
        
        // https://developer.apple.com/documentation/xctest/xctattachment/imagequality/original
        var attachment = XCTAttachment(screenshot: screenshot, quality: .original)
        // https://developer.apple.com/documentation/xctest/xctattachment/imagequality/medium
        attachment = XCTAttachment(screenshot: screenshot, quality: .medium)
        // https://developer.apple.com/documentation/xctest/xctattachment/imagequality/low
        attachment = XCTAttachment(screenshot: screenshot, quality: .low)
        add(attachment)
    }
    
    // MARK: Objects
    func testObjectInitializer1() throws {
        let object = ["Kapil" : "1"]
        
        // https://developer.apple.com/documentation/xctest/xctattachment/2887214-init
        let attachment = XCTAttachment(plistObject: object)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testObjectInitializer2() throws {
        let object = MySecureCodingClass(coder: NSCoder())
        
        // https://developer.apple.com/documentation/xctest/xctattachment/2887214-init
        let attachment = XCTAttachment(archivableObject: object!)
        attachment.lifetime = .keepAlways
        //        add(attachment)
    }
    
    
    func testObjectInitializer3() throws {
        let object = MySecureCodingClass(coder: NSCoder())
        
        // // https://developer.apple.com/documentation/xctest/xctattachment/2887215-init
        let attachment = XCTAttachment(archivableObject: object!, uniformTypeIdentifier: "MyObject")
        attachment.lifetime = .keepAlways
        //        add(attachment)
    }
    
    // MARK: String
    
    func testStringInitializer() throws {
        let string: String = "Kapil Shanbhag"
        let attachment: XCTAttachment = XCTAttachment(string: string)
        
        attachment.lifetime = .keepAlways
        
        add(attachment)
    }
    
    func testAttachmentLifetime() throws {
        let string: String = "Kapil Shanbhag"
        let attachment: XCTAttachment = XCTAttachment(string: string)
        
        // https://developer.apple.com/documentation/xctest/xctattachment/2887223-lifetime
        // https://developer.apple.com/documentation/xctest/xctattachment/lifetime
        switch attachment.lifetime {
            // https://developer.apple.com/documentation/xctest/xctattachment/lifetime/deleteonsuccess
        case .deleteOnSuccess: break
            // https://developer.apple.com/documentation/xctest/xctattachment/lifetime/keepalways
        case .keepAlways: break
        @unknown default:
            break
        }
    }
    
    func testAttachmentMetadata() {
        let string: String = "Kapil Shanbhag"
        let attachment: XCTAttachment = XCTAttachment(string: string)
        
        // https://developer.apple.com/documentation/xctest/xctattachment/2887211-name
        print(attachment.name)
        // https://developer.apple.com/documentation/xctest/xctattachment/2887217-uniformtypeidentifier
        print(attachment.uniformTypeIdentifier)
        // https://developer.apple.com/documentation/xctest/xctattachment/2887205-userinfo
        print(attachment.userInfo)
    }
}

class MySecureCodingClass: NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    func encode(with coder: NSCoder) {
        
    }
    
    required init?(coder: NSCoder) {
        
    }
    
    let name = "Kapil"
}
