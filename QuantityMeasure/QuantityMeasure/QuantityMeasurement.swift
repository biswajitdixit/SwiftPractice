//
//  QuantityMeasurement.swift
//  QuantityMeasure
//
//  Created by admin on 05/04/21.
//

import Foundation
class Unit {
    var baseValue : Double
    var unitType : UnitType
    private init(baseValue :Double, unitType:UnitType){
        self.baseValue = baseValue
        self.unitType = unitType
    }
    static let Feet = Unit(baseValue: 12.0, unitType: UnitType.Feet)
    static let Inch = Unit(baseValue: 1.0, unitType: UnitType.Yard)
    static let Yard = Unit(baseValue: 36.0, unitType: UnitType.Yard)
    static let Centimeter = Unit(baseValue: 0.4, unitType: UnitType.Centimeter)
    static let Gallon = Unit(baseValue: 3.785, unitType: UnitType.Gallon)
    static let Liter = Unit(baseValue: 1.0, unitType: UnitType.Liter)
    static let Mililiter = Unit(baseValue: 0.001, unitType: UnitType.Mililiter)
    static let Kilogram = Unit(baseValue: 1.0, unitType: UnitType.Kilogram)
    static let Gram = Unit(baseValue: 0.001, unitType: UnitType.Gram)
    static let Tonne = Unit(baseValue: 1000.0, unitType: UnitType.Tonne)
}

protocol Quantity {
    func returnUnit( unit: Unit, value: Double) -> Double
    
    func addition( firstValue: Double , secondValue: Double ) -> Double
    
    func returnTemperature(unit: UnitTemp , value: Double) -> Double
}

class QuanityMeasurement : Quantity{
    func returnTemperature(unit: UnitTemp, value: Double) -> Double {
        switch unit {
            case .Celsius:
                let temp = (value * (9.0/5)) + 32
                return temp
            case .Fahrenhite:
                let temp = (value - 32)*(5/9)
                return temp
    
        }
        
    }
    func returnUnit(unit: Unit, value: Double) -> Double {
        return value * unit.baseValue
    }
    
    func addition(firstValue: Double, secondValue: Double) -> Double {
        return firstValue + secondValue
    }
    
    
}
