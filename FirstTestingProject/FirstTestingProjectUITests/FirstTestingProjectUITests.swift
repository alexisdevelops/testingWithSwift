//
//  FirstTestingProjectUITests.swift
//  FirstTestingProjectUITests
//
//  Created by alexis on 28/02/21.
//

import XCTest

@testable import FirstTestingProject

struct PrimeCalculator {
    static func calculate(upTo max: Int, completion: @escaping
                            ([Int]) -> Void) {
        // push our work straight to a background thread
        DispatchQueue.global().async {
            guard max > 1 else {
                // if the input value is 0 or 1 exit immediately
                return
            }
            // mark all our numbers as prime
            var sieve = [Bool](repeating: true, count: max)
            // 0 and 1 are by definition not prime
            sieve[0] = false
            sieve[1] = false
            // count from 0 up to the ceiling...
            for number in 2 ..< max {
                // if this is marked as prime, then every multiple of it is not prime
                if sieve[number] == true {
                    for multiple in stride(from: number * number,
                                           to: sieve.count, by: number) {
                        sieve[multiple] = false
                    } }
            }
            // collapse our results down to a single array of primes
            let primes = sieve.enumerated().compactMap { $1 == true ? $0 : nil }
            completion(primes)
        }
    }
}


class FirstTestingProjectUITests: XCTestCase {

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
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testPrimesUpTo100ShouldBe25() {
        // given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        
        // when
        PrimeCalculator.calculate(upTo: maximumCount) {
            XCTAssertEqual($0.count, 25)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
}
