//
//  SimpleCalculatorUITestsLaunchTests.swift
//  SimpleCalculatorUITests
//
//  Created by runner on 23/2/23.
//  Copyright © 2023 Alex Ilyenko. All rights reserved.
//

import XCTest

final class SimpleCalculatorUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
