//
//  LengthUnit.swift
//  Quantity_Measurement
//
//  Created by admin on 04/04/21.
//

import Foundation

enum Unit: Int {
    case Inch = 0 , Centimeter , Foot , Meter , Mile
    
    static func allCase() -> [String] {
        var i = 0
        var list = [ String ] ()
        while let unit = Unit(rawValue: i ) {
            list.append(unit.description())
            i = i + 1
        }
        return list
    }
    
    
    func description() -> String {
            switch self {
            case .Inch:
                return "Inch"
            case .Centimeter:
                return "Centimeter"
            case .Foot:
                return "Foot"
            case .Meter:
                return "Meter"
            case .Mile:
                return "Mile"
            }
        }
        
        static func fromString(_ string: String) -> Unit? {
            if string == "Inch" {
                return .Inch
            } else if string == "Centimeter" {
                return .Centimeter
            } else if string == "Foot" {
                return .Foot
            } else if string == "Meter" {
                return .Meter
            } else if string == "Mile" {
                return .Mile
            } else {
                return nil
            }
        }
        
        func convertTo(unit to: Unit, value val: Double) -> Double {
            var constant = 1.0
            switch self {
            case .Inch:
                if to == .Centimeter {
                    constant = 2.54
                } else if to == .Foot {
                    constant = 0.08333333
                } else if to == .Meter {
                    constant = 0.0254
                } else if to == .Mile {
                    constant = 1.5783e-5
                }
                
            case .Centimeter:
                if to == .Inch {
                    constant = 0.0393701
                } else if to == .Foot {
                    constant = 0.0328084
                } else if to == .Meter {
                    constant = 0.01
                } else if to == .Mile {
                    constant = 6.2137e-6
                }
                
            case .Foot:
                if to == .Inch {
                    constant = 12;
                } else if to == .Centimeter {
                    constant = 30.48
                } else if to == .Meter {
                    constant = 0.3048
                } else if to == .Mile {
                    constant = 0.000189394
                }
                
            case .Meter:
                if to == .Inch {
                    constant = 39.3701
                } else if to == .Centimeter {
                    constant = 100
                } else if to == .Foot {
                    constant = 3.28084
                } else if to == .Mile {
                    constant = 0.000621371
                }
                
            case .Mile:
                if to == .Inch {
                    constant = 63360
                } else if to == .Centimeter {
                    constant = 160934
                } else if to == .Foot {
                    constant = 5280
                } else if to == .Meter {
                    constant = 1609.34
                }
            }
            
            return constant * val
        }
}
