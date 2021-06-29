//
//  IplAnalyserTests.swift
//  IplAnalyserTests
//
//  Created by admin on 13/04/21.
//

import XCTest
@testable import IplAnalyser

class IplAnalyserTests: XCTestCase {

    func getTopBatingAvg_OfCricketers_ShouldReturnName(){
        let avg = BatsMenOutPut()
        avg.loadData()
        let result = avg.sortByBattingAvg()
        XCTAssertEqual("MS Dhoni", result.playerName)
    }
    
    func getTopStrikingRates_OfCricketers_ShouldReturnName(){
        let strike = BatsMenOutPut()
        strike.loadData()
        let result = strike.sortByBatingStrike()
        XCTAssertEqual("Ishant Sharma", result.playerName)
    }
    
    func getCricketers_WithMax6sAnd4s_ReturnName() {
        let max = BatsMenOutPut()
        max.loadData()
        let result = max.sortByMax6_4()
        XCTAssertEqual("Andre Russell", result.playerName)
    }
    
    func getCricketers_WithBestStrikingRates_WithMax6sAnd4s_ReturnName() {
        let strike = BatsMenOutPut()
        strike.loadData()
        let result = strike.sortByBestStrikeAnd6_4()
        XCTAssertEqual("Andre Russell", result.playerName)
    }
    
    func  getCricketers_WithGreatAvgAndBestStrikingRates_ReturnName() {
        let avg = BatsMenOutPut()
        avg.loadData()
        let result = avg.sortByAvgAndStrike()
        XCTAssertEqual("David Warner", result.playerName)
    }
    
    func getCricketers_WithMaxRunsAndBestAvg_ReturnName() {
        let avg = BatsMenOutPut()
        avg.loadData()
        let result = avg.sortBymaxRunAndAvg()
        XCTAssertEqual("David Warner", result.playerName)
    }
    
    func getCricketers_TopBowlingAvg_ReturnName() {
        let avg = BowlerOutPut()
        avg.loadData()
        let result = avg.sortBowlingAvg()
        XCTAssertEqual("Krishnappa Gowtham", result.playerName)
    }
    func getCricketers_TopStrikingRates_ReturnName() {
        let strike = BowlerOutPut()
        strike.loadData()
        let result = strike.sortByStrikingRate()
        XCTAssertEqual("Krishnappa Gowtham", result.playerName)
    }
    func getCricketers_BestEconomy_ReturnName() {
        let eco = BowlerOutPut()
        eco.loadData()
        let result = eco.sortByBestEconomy()
        XCTAssertEqual("Ben Cutting", result.playerName)
    }
    func getCricketers_BestStrikeRatesWith4wAnd5w_ReturnName(){
        let strike = BowlerOutPut()
        strike.loadData()
        let result = strike.sortByStrike5w4w()
        XCTAssertEqual("Imran Tahir", result.playerName)
    }
    func getCricketers_withGreatBowlingAvgWithBestStrikingRates_ReturnName() {
        let avg = BowlerOutPut()
        avg.loadData()
        let result = avg.sortByAvgAndStrikingRate()
        XCTAssertEqual("Krishnappa Gowtham", result.playerName)
    }
    
    func getCricketers_MaxWicketsWithGreatBowlingAvg_ReturnName() {
        let avg = BowlerOutPut()
        avg.loadData()
        let result = avg.sortByMaxWicketAndavg()
        XCTAssertEqual("Imran Tahir", result.playerName)
    }
    func getCricketers_WithMaxRunsAndWickets_ReturnName(){
        let run = BowlerOutPut()
        run.loadData()
        let result = run.sortByMaxrunAndWicket()
        XCTAssertEqual("Imran Tahir", result.playerName)
    }


}
