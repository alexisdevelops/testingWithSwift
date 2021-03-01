//
//  ConverterTests.swift
//  FirstTestingProjectTests
//
//  Created by alexis on 28/02/21.
//

import Foundation
import XCTest

@testable import FirstTestingProject

class ConverterTests: XCTestCase {
    var sut: Converter!
    
    override func setUpWithError() throws {
        sut = Converter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test32FahrenheitIsZeroCelsius() {
        // given
        let input = 32.0
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        // then
        XCTAssertEqual(celsius, 0, accuracy: 0.000001)
    }
    
    func test212FahrenheitIs100Celsius() {
        // given
        let input = 212.0
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        // then
        XCTAssertEqual(celsius, 100, accuracy: 0.000001)
    }
    
    func test100FahrenheitIs37Celsius() {
        // given
        let input = 100.0
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        // then
        XCTAssertEqual(celsius, 37.777777, accuracy: 0.000001)
    }
}
