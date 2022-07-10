//
//  UITestingNetworkingUITests.swift
//  UITestingNetworkingUITests
//
//  Created by Toomas Vahter on 14.05.2022.
//

import XCTest

class UITestingNetworkingUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments = ["--uitesting"]
        app.launch()
        app.buttons["Load Data"].tap()
        XCTAssertEqual(app.staticTexts.element.label, "MyMockedData")
    }
}
