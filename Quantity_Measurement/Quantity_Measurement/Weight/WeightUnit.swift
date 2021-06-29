//
//  WeightUnit.swift
//  Quantity_Measurement
//
//  Created by admin on 04/04/21.
//

import Foundation
enum UnitWeight: Int {
    case Gram = 0 , Kilogram , Tonne
    
    static func allCase() -> [String] {
        var i = 0
        var list = [ String ] ()
        while let unit = UnitWeight(rawValue: i ) {
            list.append(unit.description())
            i = i + 1
        }
        return list
    }
    func description() -> String {
            switch self {
            case .Gram:
                return "Gram"
            case .Kilogram:
                return "Kilogram"
            case .Tonne:
                return "Tonne"
            }
        }
    static func fromString(_ string: String) -> UnitWeight? {
        if string == "Gram" {
            return .Gram
        } else if string == "Kilogram" {
            return .Kilogram
        } else if string == "Tonne" {
            return .Tonne
        } else {
            return nil
        }
    }
    func convertTo(unit to: UnitWeight, value val: Double) -> Double {
        var constant = 1.0
        switch self {
        case .Gram:
            if to == .Kilogram {
                constant = 0.001
            } else if to == .Tonne {
                constant = 1e-6
            }
            
        case .Kilogram:
            if to == .Gram {
                constant = 1000
            } else if to == .Tonne {
                constant = 0.001
            }
            
        case .Tonne:
            if to == .Gram {
                constant = 1e+6;
            } else if to == .Kilogram {
                constant = 1000
            }
            
        }
        
        return constant * val
    }
}

