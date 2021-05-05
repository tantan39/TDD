//
//  TDDTests.swift
//  TDDTests
//
//  Created by Tan Tan on 5/4/21.
//

import XCTest
@testable import TDD

class TDDTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadingBookAddsToLibrary() {
        //given
        let bookToBuy = "Greate Expectations"
        var user = User()
        
        //when
        user.buy(bookToBuy)
        
        //then
        XCTAssertTrue(user.owns(bookToBuy))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
