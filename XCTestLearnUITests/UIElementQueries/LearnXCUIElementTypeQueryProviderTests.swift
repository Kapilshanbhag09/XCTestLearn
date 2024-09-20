//
//  LearnXCUIElementTypeQueryProviderTests.swift
//  XCTestLearnUITests
//
//  Created by Kapil Shanbhag on 19/09/24.
//

import XCTest

final class LearnXCUIElementTypeQueryProviderTests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }

    func testExample() throws {

        // app.button gives the XCUIElementQuery.
        let buttonQuery = app.buttons

        // buttonQuery["MyAdd_Button"] refers to subscript(string:) of XCUIQueryElement
        // button refers to XCUIElement.
        let button = buttonQuery["MyAdd_Button"]

        // XCTAssert(button.exists)
        XCTAssert(button.exists)
        print(button.debugDescription)

        let myExpectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            button.tap()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            myExpectation.fulfill()
        }

        wait(for: [myExpectation])
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testFirstMatchVar() {

        // app.button gives the XCUIElementQuery.
        let buttonQuery = app.buttons

        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/2902250-firstmatch
        // Return the firstElement that has matched
        let button = buttonQuery.firstMatch
        print(button.title)

        // XCTAssert(button.exists)
        XCTAssert(button.exists)
        print(button.debugDescription)
    }

    func testDescendantElements() {
        
        // MARK: activityIndicators.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500770-activityindicators
        let activityIndicatorQuery = app.activityIndicators
        XCTAssert(activityIndicatorQuery.firstMatch.exists)
        print(activityIndicatorQuery.debugDescription)
        
        // MARK: alerts.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500430-alerts
        let alertsQuery = app.alerts
        XCTAssertFalse(alertsQuery.firstMatch.exists)
        print(alertsQuery.debugDescription)
        
        // MARK: browsers.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500652-browsers
        let browserQuery = app.browsers
        XCTAssertFalse(browserQuery.firstMatch.exists)
        print(browserQuery.debugDescription)
        
        // MARK: buttons.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500661-buttons
        let buttonQuery = app.buttons
        XCTAssertTrue(buttonQuery.firstMatch.exists)
        print(buttonQuery.debugDescription)
        
        // MARK: cells.
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500840-cells
        let cellQuery = app.cells
        XCTAssertFalse(cellQuery.firstMatch.exists)
        print(cellQuery.debugDescription)
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500871-checkboxes
        let checkBoxQuery = app.checkBoxes
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500731-collectionviews
        let collectionViewsQuery = app.collectionViews
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500414-colorwells
        let colorWellsQuery = app.colorWells
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500376-comboboxes
        let comboBoxesQuery = app.comboBoxes
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500782-datepickers
        var query = app.datePickers
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500879-decrementarrows
        query = app.decrementArrows
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500337-dialogs
        query = app.dialogs
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500431-disclosuretriangles
        query = app.disclosureTriangles
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/3140730-disclosedchildrows
        query = app.disclosedChildRows
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500657-dockitems
        query = app.dockItems
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500449-drawers
        query = app.drawers
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1501023-grids
        query = app.grids
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500993-groups
        query = app.groups
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500359-handles
        query = app.handles
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1501004-helptags
        query = app.helpTags
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500741-icons
        query = app.icons
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500822-images
        query = app.images
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500539-incrementarrows
        query = app.incrementArrows
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500511-keyboards
        query = app.keyboards
        
        // https://developer.apple.com/documentation/xctest/xcuielementtypequeryprovider/1500593-keys
        query = app.keys
        
        query = app.layoutAreas
        query = app.layoutItems
        query = app.levelIndicators
        query = app.links
        query = app.maps
        query = app.mattes
        query = app.menuBarItems
        query = app.menuBars
        query = app.menuButtons
        query = app.menuItems
        query = app.menus
        query = app.navigationBars
        query = app.otherElements
        query = app.outlineRows
        query = app.outlines
        query = app.pageIndicators
        query = app.pickerWheels
        query = app.pickers
        query = app.popUpButtons
        query = app.popovers
        query = app.progressIndicators
        query = app.radioButtons
        query = app.radioGroups
        query = app.ratingIndicators
        query = app.relevanceIndicators
        query = app.rulerMarkers
        query = app.rulers
        query = app.scrollBars
        query = app.scrollViews
        query = app.searchFields
        query = app.secureTextFields
        query = app.segmentedControls
        query = app.sheets
        query = app.sliders
        query = app.splitGroups
        query = app.splitters
        query = app.staticTexts
        query = app.statusBars
        query = app.statusItems
        query = app.steppers
        query = app.switches
        query = app.tabBars
        query = app.tabGroups
        query = app.tableColumns
        query = app.tableRows
        query = app.tables
        query = app.tabs
        query = app.textFields
        query = app.textViews
        query = app.timelines
        query = app.toggles
        query = app.toolbarButtons
        query = app.toolbars
        query = app.touchBars
        query = app.valueIndicators
        query = app.webViews
        query = app.windows
        
        
        
        
        let otherElementsQuery = app.otherElements
        print(otherElementsQuery.debugDescription)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
