//
//  Converter.swift
//  FirstTestingProject
//
//  Created by alexis on 28/02/21.
//

import Foundation


struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit:
                                        UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
}


