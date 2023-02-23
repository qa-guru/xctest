//
//  SimpleCalculatorUITests.swift
//  SimpleCalculatorUITests
//
//  Created by runner on 23/2/23.
//  Copyright © 2023 Alex Ilyenko. All rights reserved.
//

import XCTest

final class SimpleCalculatorUITests: XCTestCase {
    
    let app = XCUIApplication(bundleIdentifier: "com.github.alexilyenko.SimpleCalculator")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        app.launch()
        print(app.debugDescription)
    }
    
    func testRecordAndPlay() throws {
        XCTContext.runActivity(named: "Запуск приложения") { _ in
            app.launch()
        }
        
        XCTContext.runActivity(named: "Складываем 2  и 2") { _ in
            app.buttons["2"].firstMatch.tap()
            app.buttons["+"].firstMatch.tap()
            app.buttons["2"].firstMatch.tap()
            app.buttons["="].firstMatch.tap()
        }
        
        XCTContext.runActivity(named: "Проверка итоговой суммы") { _ in
            XCTAssert(app.staticTexts["4"].firstMatch.waitForExistence(timeout: 10), "Некоректная итоговая сумма")
        }
        
        XCTContext.runActivity(named: "Делаем скриншот") { _ in
            let screenshot = app.windows.firstMatch.screenshot()
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.lifetime = .keepAlways
            add(attachment)
        }
    
    }
    
    func testEnableToggle() throws {
        app.launch()
        app.navigationBars["Calculator"].buttons["Settings"].firstMatch.tap()
        
//        TODO: Не работает, так как не получается найти правильный локатор (позже поправлю)
        app.switches["switch"].firstMatch.tap()
        
        app.navigationBars["Settings"].buttons["Calculator"].tap()
        app.buttons["2"].firstMatch.tap()
        app.buttons["+"].firstMatch.tap()
        app.buttons["2"].firstMatch.tap()
        app.buttons["="].firstMatch.tap()
        let result = Double(app.staticTexts["4"].firstMatch.label)
        XCTAssertEqual(result, 4.0)
        
    }
    

}
