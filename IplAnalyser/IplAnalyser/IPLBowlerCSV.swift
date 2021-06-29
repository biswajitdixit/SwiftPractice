//
//  IPLBowlerCSV.swift
//  IplAnalyser
//
//  Created by admin on 13/04/21.
//

import Foundation
struct IPLBowlerCSV
{
    var POS: String
    var playerName: String
    var matches: String
    var innings: String
    var overs: String
    var runs: Int
    var totalWickets: Int
    var BBI: String
    var average: Double
    var Economy: Double
    var strikeRate: Double
    var fourWickets: Int
    var fiveWickets: Int
    
    init(POS: String , playerName: String , matches: String ,innings: String,
         overs: String,runs: Int, totalWickets: Int ,BBI: String,average: Double,Economy: Double ,strikeRate: Double,fourWickets: Int, fiveWickets: Int) {
        self.POS = POS
        self.playerName = playerName
        self.matches = matches
        self.innings = innings
        self.overs = overs
        self.runs = runs
        self.totalWickets = totalWickets
        self.BBI = BBI
        self.average = average
        self.Economy = Economy
        self.strikeRate =  strikeRate
        self.fourWickets = fourWickets
        self.fiveWickets = fiveWickets
    }
}
