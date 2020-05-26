//
//  TasksTests.swift
//  TasksTests
//
//  Created by saori on 2020/03/29.
//  Copyright © 2020 saori. All rights reserved.
//

import XCTest
@testable import Tasks

class DateTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testDate() {
        let calendar = Calendar.current

        XCTContext.runActivity(named: "Date Test") { _ in
            XCTContext.runActivity(named: "Stringへフォーマット") { _ in
                let date = calendar.date(from: DateComponents(year: 2015, month: 1, day: 1))

                XCTAssertEqual(date?.string(), "2015/01/01")
            }

            XCTContext.runActivity(named: "経過日数") { _ in
                XCTContext.runActivity(named: "月をまたぐ(2020/5/26 -> 2020/6/6)") { _ in
                    let date = calendar.date(from: DateComponents(year: 2020, month: 5, day: 26))
                    let comparison = calendar.date(from: DateComponents(year: 2020, month: 6, day: 7))
                    let elapsedDays = date?.elapsedDays(date: comparison)

                    XCTAssertEqual(elapsedDays, 12)
                }
                XCTContext.runActivity(named: "年をまたぐ(2020/12/31 -> 2021/1/1)") { _ in
                    let date = calendar.date(from: DateComponents(year: 2020, month: 12, day: 31))
                    let comparison = calendar.date(from: DateComponents(year: 2021, month: 1, day: 1))
                    let elapsedDays = date?.elapsedDays(date: comparison)

                    XCTAssertEqual(elapsedDays, 1)
                }
            }
        }
    }

}
