//
//  UiTestingUITests.swift
//  UiTestingUITests
//
//  Created by Enzo Henrique Botelho Romão on 05/03/26.
//

import XCTest

final class UiTestingUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    @MainActor
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let weightTextField = app.textFields["Ex: 75.5"]
        weightTextField.tap()
        weightTextField.typeText("65")
        
        let heightTextField = app.textFields["Ex: 1.75"]
        heightTextField.tap()
        heightTextField.typeText("1.83")
        
        app.buttons["Calcular"].firstMatch.tap()
        
        XCTAssert(app.staticTexts["19.41"].firstMatch.exists)
    }
}
