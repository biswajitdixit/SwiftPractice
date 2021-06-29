//
//  QuantityMeasureTests.swift
//  QuantityMeasureTests
//
//  Created by admin on 04/04/21.
//

import XCTest
@testable import QuantityMeasure

class QuantityMeasureTests: XCTestCase {
    //Feet
    func given0FeetAnd0Feet_IfEqual_ShouldReturnTrue()  {
        let quantitymeasurement = QuanityMeasurement()
        let feet1 = quantitymeasurement.returnUnit(unit: .Feet, value: 0.0)
        let feet2 = quantitymeasurement.returnUnit(unit: .Feet, value: 0.0)
        XCTAssertEqual(feet1, feet2)
    }
    func given0FeetAnd1Feet_IfNotEqual_ShouldReturnTrue()  {
        let quantitymeasurement = QuanityMeasurement()
        let feet1 = quantitymeasurement.returnUnit(unit: .Feet, value: 0.0)
        let feet2 = quantitymeasurement.returnUnit(unit: .Feet, value: 1.0)
        XCTAssertNotEqual(feet1, feet2)
    }
    func givenValueCheck_IfEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let feet1 = quantitymeasurement.returnUnit(unit: .Feet, value: 3.2)
        let feet2 = quantitymeasurement.returnUnit(unit: .Feet, value: 3.2)
        XCTAssertEqual(feet1, feet2)
        
    }
    
    //Inch
    func given0InchAnd0Inch_IfEqual_ShouldReturnTrue() throws{
        let quantitymeasurement = QuanityMeasurement()
        let inch1 = quantitymeasurement.returnUnit(unit: .Inch, value: 0.0)
        let inch2 = quantitymeasurement.returnUnit(unit: .Inch, value: 0.0)
        XCTAssertEqual(inch1, inch2)
        
    }
    func given0InchAnd1Inch_IfNotEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let inch1 = quantitymeasurement.returnUnit(unit: .Inch, value: 0.0)
        let inch2 = quantitymeasurement.returnUnit(unit: .Inch, value: 1.0)
        XCTAssertNotEqual(inch1, inch2)
    }
    func givenValueCheckForInch_IfEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let inch1 = quantitymeasurement.returnUnit(unit: .Inch, value: 4.2)
        let inch2 = quantitymeasurement.returnUnit(unit: .Inch, value: 4.2)
        XCTAssertEqual(inch1, inch2)
        
    }
    func given1FeetAnd1Inch_IfNotEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let feet = quantitymeasurement.returnUnit(unit: .Feet, value: 1.0)
        let inch = quantitymeasurement.returnUnit(unit: .Inch, value: 1.0)
        XCTAssertNotEqual(feet, inch)
        
    }
    func given1InchAnd1Feet_IfNotEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let inch = quantitymeasurement.returnUnit(unit: .Inch, value: 1.0)
        let feet = quantitymeasurement.returnUnit(unit: .Feet, value: 1.0)
        XCTAssertNotEqual(inch, feet)
        
    }
    func given12InchAnd1Feet_IfEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let inch = quantitymeasurement.returnUnit(unit: .Inch, value: 12.0)
        let feet = quantitymeasurement.returnUnit(unit: .Feet, value: 1.0)
        XCTAssertEqual(inch, feet)
        
    }
    
    //Yard
    func given3FeetAnd1Yard_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let feet = quantitymeasurement.returnUnit(unit: .Feet, value: 3.0)
        let yard = quantitymeasurement.returnUnit(unit: .Yard, value: 1.0)
        XCTAssertEqual(feet, yard)
        
    }
    func given1FeetAnd1Yard_WhenNotEqual_Should_ReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let feet = quantitymeasurement.returnUnit(unit: .Feet, value: 1.0)
        let yard = quantitymeasurement.returnUnit(unit: .Yard, value: 1.0)
        XCTAssertNotEqual(feet, yard)
        
    }
    func given1InchAnd1Yard_WhenNotEqual_Should_ReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let inch = quantitymeasurement.returnUnit(unit: .Inch, value: 1.0)
        let yard = quantitymeasurement.returnUnit(unit: .Yard, value: 1.0)
        XCTAssertNotEqual(inch, yard)
        
    }
    func given1YardAnd36Inch_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let yard = quantitymeasurement.returnUnit(unit: .Yard, value: 1.0)
        let inch = quantitymeasurement.returnUnit(unit: .Inch, value: 36.0)
        XCTAssertEqual(yard, inch)
        
    }
    func given36InchAnd1Yard_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let inch = quantitymeasurement.returnUnit(unit: .Inch, value: 36.0)
        let yard = quantitymeasurement.returnUnit(unit: .Yard, value: 1.0)
        XCTAssertEqual(inch, yard)
        
    }
    func given1Yard3Feet_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let yard = quantitymeasurement.returnUnit(unit: .Yard, value: 1.0)
        let feet = quantitymeasurement.returnUnit(unit: .Feet, value: 3.0)
        XCTAssertEqual(yard, feet)
        
    }
    
    //Centimeter
    func given0CentimeterAnd0Centimeter_If_Equal_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let centimeter1 = quantitymeasurement.returnUnit(unit: .Centimeter, value: 0.0)
        let centimeter2 = quantitymeasurement.returnUnit(unit: .Centimeter, value: 0.0)
        XCTAssertEqual(centimeter1, centimeter2)
    }
    func given0CentimeterAnd1Centimeter_IfNotEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let centimeter1 = quantitymeasurement.returnUnit(unit: .Centimeter, value: 0.0)
        let centimeter2 = quantitymeasurement.returnUnit(unit: .Centimeter, value: 1.0)
        XCTAssertNotEqual(centimeter1, centimeter2)
    }
    func given0CentimeterAnd1Inch_IfNotEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let centimeter = quantitymeasurement.returnUnit(unit: .Centimeter, value: 0.0)
        let inch = quantitymeasurement.returnUnit(unit: .Inch, value: 1.0)
        XCTAssertNotEqual(centimeter, inch)
        
    }
    func given2InchAnd5Centimeter_IfEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let inch = quantitymeasurement.returnUnit(unit: .Inch, value: 2.0)
        let centimeter = quantitymeasurement.returnUnit(unit: .Centimeter, value: 5.0)
        XCTAssertEqual(inch, centimeter)
        
    }
    func given2InchAnd2Inch_WhenEqualTo4Inch_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let inch1 = quantitymeasurement.returnUnit(unit: .Inch, value: 2.0)
        let inch2 = quantitymeasurement.returnUnit(unit: .Inch, value: 2.0)
        let result = quantitymeasurement.addition(firstValue: inch1, secondValue: inch2)
        XCTAssertEqual(4.0, result)
        
    }
    func given1FeetAnd2Inch_WhenEqualTo14Inch_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let feet = quantitymeasurement.returnUnit(unit: .Feet, value: 1.0)
        let inch1 = quantitymeasurement.returnUnit(unit: .Inch, value: 2.0)
        let inch2 = quantitymeasurement.addition(firstValue: feet, secondValue: inch1)
        XCTAssertEqual(14.0, inch2)
        
    }
    func given1FeetAnd1Feet_WhenEqualTo24Inch_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let feet1 = quantitymeasurement.returnUnit(unit: .Feet, value: 1.0)
        let feet2 = quantitymeasurement.returnUnit(unit: .Feet, value: 1.0)
        let inch = quantitymeasurement.addition(firstValue: feet1, secondValue: feet2)
        XCTAssertEqual(24.0, inch)
        
    }
    func given2InchAnd2point5Centimeter_WhenEqualTo3Inch_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let inch1 = quantitymeasurement.returnUnit(unit: .Inch, value: 2.0)
        let centimeter = quantitymeasurement.returnUnit(unit: .Centimeter, value: 2.5)
        let inch = quantitymeasurement.addition(firstValue: inch1,secondValue:centimeter)
        XCTAssertEqual(3.0, inch)
        
    }
    
    //Gallon
    func given0GallonAnd0Gallon_WhenEqual_ShouldReturntrue(){
        let quantitymeasurement = QuanityMeasurement()
        let gallon1 = quantitymeasurement.returnUnit(unit: .Gallon, value: 0.0)
        let gallon2 = quantitymeasurement.returnUnit(unit: .Gallon, value: 0.0)
        XCTAssertEqual(gallon1, gallon2)
        
    }
    
    func given0GallonAnd0Liter_When_Equal_Should_Returntrue(){
        let quantitymeasurement = QuanityMeasurement()
        let gallon = quantitymeasurement.returnUnit(unit: .Gallon, value: 0.0)
        let liter = quantitymeasurement.returnUnit(unit: .Liter, value: 0.0)
        XCTAssertEqual(gallon, liter)
    }
    
    func given0Gallon1Liter_WhenNotEqual_Should_Returntrue(){
        let quantitymeasurement = QuanityMeasurement()
        let gallon = quantitymeasurement.returnUnit(unit: .Gallon, value: 0.0)
        let liter = quantitymeasurement.returnUnit(unit: .Liter, value: 1.0)
        XCTAssertNotEqual(gallon, liter)
    }
    
    func given1GallonAnd3Point78Liter_WhenEqual_Should_ReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let gallon = quantitymeasurement.returnUnit(unit: .Gallon, value: 1.0)
        let liter = quantitymeasurement.returnUnit(unit: .Liter, value: 3.785)
        XCTAssertEqual(gallon, liter)
    }
    
    //Liter
    func given0LiterAnd0Liter_When_Equal_Should_Returntrue(){
        let quantitymeasurement = QuanityMeasurement()
        let liter1 = quantitymeasurement.returnUnit(unit: .Liter, value: 0.0)
        let liter2 = quantitymeasurement.returnUnit(unit: .Liter, value: 0.0)
        XCTAssertEqual(liter1, liter2)
    }
    func given0LiterAnd0Miliiter_When_Equal_Should_Returntrue(){
        let quantitymeasurement = QuanityMeasurement()
        let liter = quantitymeasurement.returnUnit(unit: .Liter, value: 0.0)
        let mililiter = quantitymeasurement.returnUnit(unit: .Mililiter, value: 0.0)
        XCTAssertEqual(liter, mililiter)
        
    }
    func given0LiterAnd1Miliiter_WhenNotEqual_Should_Returntrue(){
        let quantitymeasurement = QuanityMeasurement()
        let liter = quantitymeasurement.returnUnit(unit: .Liter, value: 0.0)
        let mililiter = quantitymeasurement.returnUnit(unit: .Mililiter, value: 1.0)
        XCTAssertNotEqual(liter, mililiter)
        
    }
    
    //Mililiter
    func given0MililiterAnd0Mililiter_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let mililiter1 = quantitymeasurement.returnUnit(unit: .Mililiter, value: 0.0)
        let mililiter2 = quantitymeasurement.returnUnit(unit: .Mililiter, value: 0.0)
        XCTAssertEqual(mililiter1, mililiter2)
    }
    func given1LiterAnd1000Mililiter_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let liter = quantitymeasurement.returnUnit(unit: .Liter, value: 1.0)
        let mililiter = quantitymeasurement.returnUnit(unit: .Mililiter, value:1000.0)
        XCTAssertEqual(liter, mililiter)
    }
    
    //Add Volume In Liter
    func given1GallonAnd3Point78Liter_WhenEqualTo7Point57Liter_Should_ReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let gallon = quantitymeasurement.returnUnit(unit:.Gallon, value: 1.0)
        let liter1 = quantitymeasurement.returnUnit(unit: .Liter, value: 3.785)
        let liter = quantitymeasurement.addition(firstValue: gallon, secondValue: liter1)
        XCTAssertEqual(7.57, liter)
    }
    func given1LiterAnd1000Mililiter_WhenEqualTo2Liter_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let liter1 = quantitymeasurement.returnUnit(unit: .Liter, value: 1.0)
        let mililiter = quantitymeasurement.returnUnit(unit:.Mililiter, value: 1000.0)
        let liter = quantitymeasurement.addition(firstValue: liter1, secondValue:mililiter)
        XCTAssertEqual(2.0, liter)
    }
    
    //Kilogram
    func given0KilogramAnd0Kilogram_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let kilogram1 = quantitymeasurement.returnUnit(unit:.Kilogram, value: 0.0)
        let kilogram2 = quantitymeasurement.returnUnit(unit:.Kilogram, value: 0.0)
        XCTAssertEqual(kilogram1, kilogram2)
        
    }
    func given0KilogramAnd0Gram_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let kilogram = quantitymeasurement.returnUnit(unit:.Kilogram, value: 0.0)
        let gram = quantitymeasurement.returnUnit(unit:.Gram, value: 0.0)
        XCTAssertEqual(kilogram, gram)
    }
    func given0KilogramAnd1Gram_WhenNotEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let kilogram = quantitymeasurement.returnUnit(unit:.Kilogram, value: 0.0)
        let gram = quantitymeasurement.returnUnit(unit:.Gram, value: 1.0)
        XCTAssertNotEqual(kilogram, gram)
    }
    
    //Tonne
    func given0TonneAnd0Tonne_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let tonne1 = quantitymeasurement.returnUnit(unit:.Tonne, value: 0.0)
        let tonne2 = quantitymeasurement.returnUnit(unit:.Tonne, value: 0.0)
        XCTAssertEqual(tonne1, tonne2)
        
    }
    func given0TonneAnd0Gram_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let tonne = quantitymeasurement.returnUnit(unit:.Tonne, value: 0.0)
        let gram = quantitymeasurement.returnUnit(unit:.Gram, value: 0.0)
        XCTAssertEqual(tonne, gram)
    }
    func given0TonneAnd1Gram_WhenNotEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let tonne = quantitymeasurement.returnUnit(unit:.Tonne, value: 0.0)
        let gram = quantitymeasurement.returnUnit(unit:.Gram, value: 1.0)
        XCTAssertNotEqual(tonne, gram)
    }
    
    //Gram
    func given0GramAnd0Gram_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let gram1 = quantitymeasurement.returnUnit(unit:.Gram, value: 0.0)
        let gram2 = quantitymeasurement.returnUnit(unit:.Gram, value: 0.0)
        XCTAssertEqual(gram1, gram2)
        }
    func given1KilogramAnd1000Gram_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let kilogram = quantitymeasurement.returnUnit(unit:.Kilogram, value: 1.0)
        let gram = quantitymeasurement.returnUnit(unit:.Gram, value: 1000.0)
        XCTAssertEqual(kilogram, gram)
    }
    func given1TonneAnd1000Kilogram_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let tonne = quantitymeasurement.returnUnit(unit:.Tonne, value: 1.0)
        let kilogram = quantitymeasurement.returnUnit(unit:.Kilogram, value: 1000.0)
        XCTAssertEqual(tonne, kilogram)
    }
    func given1TonneAnd1000gram_WhenEqualTo1001Kilogram_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let tonne = quantitymeasurement.returnUnit(unit:.Tonne, value: 1.0)
        let gram = quantitymeasurement.returnUnit(unit:.Gram, value: 1000.0)
        let kilogram = quantitymeasurement.addition(firstValue: tonne, secondValue: gram)
        XCTAssertEqual(1001.0, kilogram)
        
    }
    
    //Temperature
    func given32FahrenheitAnd0Celcius_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let fharenhite = quantitymeasurement.returnTemperature(unit:.Fahrenhite, value:32.0)
        let celsius = 0.0
        XCTAssertEqual(fharenhite,celsius )
        
    }
    func given0FahrenheitAnd1Celcius_WhenNotEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let fharenhite = 0.0
        let celsius = quantitymeasurement.returnTemperature(unit:.Celsius, value:1.0)
        XCTAssertNotEqual(fharenhite,celsius )
        
    }
    func given212FharenhiteAnd100Celcius_WhenEqual_ShouldReturnTrue(){
        let quantitymeasurement = QuanityMeasurement()
        let fharenhite = quantitymeasurement.returnTemperature(unit:.Fahrenhite, value:212.0)
        let celsius = 100.0
        XCTAssertEqual(fharenhite,celsius )
        
    }
    
}
