//
//  TemperatureUnit.swift
//  Quantity_Measurement
//
//  Created by admin on 04/04/21.
//

import Foundation
enum UnitTemperature: Int {
    case Celsius = 0 , Fahrenheit , Kelvin
    
    static func allCase() -> [String] {
        var i = 0
        var list = [ String ] ()
        while let unit = UnitTemperature(rawValue: i ) {
            list.append(unit.description())
            i = i + 1
        }
        return list
    }
    func description() -> String {
            switch self {
            case .Celsius:
                return "Celsius"
            case .Fahrenheit:
                return "Fahrenheit"
            case .Kelvin:
                return "Kelvin"
            }
        }
    static func fromString(_ string: String) -> UnitTemperature? {
        if string == "Celsius" {
            return .Celsius
        } else if string == "Fahrenheit" {
            return .Fahrenheit
        } else if string == "Kelvin" {
            return .Kelvin
        } else {
            return nil
        }
    }
    func convertTo(unit to: UnitTemperature, value val: Double) -> Double {
        var answer = 1.0
        switch self {
        case .Celsius:
            if to == .Fahrenheit {
                 answer = (val * (9/5)) + 32
            } else if to == .Kelvin {
                 answer = val+273.15
            }
            
        case .Fahrenheit:
            if to == .Celsius {
                 answer = (val - 32)*(5/9)
                return answer
            } else if to == .Kelvin {
                 answer = (val - 32)*(5/9)+273.15
            }
            
        case .Kelvin:
            if to == .Celsius {
                 answer = val - 273.15
            } else if to == .Fahrenheit {
                 answer = (val - 273.15) * (9/5) + 32
            }
            
        }
        return answer
    }
}

