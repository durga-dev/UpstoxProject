//
//  UpStocksProjectTests.swift
//  UpStocksProjectTests
//
//  Created by Durga Ballabha Panigrahi on 01/12/22.
//

import XCTest
@testable import UpStocksProject

final class UpStocksProjectTests: XCTestCase {

    var homeViewModel: HomeViewModel?
    
    override func setUpWithError() throws {
        homeViewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        homeViewModel = nil
    }
    
    func testSumWithSuccess() {
        let sum = homeViewModel?.sum(a: 5, b: 3)
        XCTAssertTrue(sum == 8)
    }
    
    func testSumWithFail() {
        let sum = homeViewModel?.sum(a: 5, b: 3)
        XCTAssertFalse(sum == 7, "hhhhh")
    }
    
    func testViewDidLoadSuccess() {
        let loadingExpectation = expectation(description: "Wait for loading data")
        homeViewModel?.updateHoldingData = { holdingData in
            XCTAssert(
                holdingData != nil,
                "Data not loaded"
            )
            loadingExpectation.fulfill()
        }
        
        homeViewModel?.viewDidLoad()
        
        wait(
            for: [
                loadingExpectation
        ],
            timeout: 2, enforceOrder: true)
    }

}
