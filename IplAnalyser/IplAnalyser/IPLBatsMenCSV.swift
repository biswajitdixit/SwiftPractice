//
//  IPLBatsMenCSV.swift
//  IplAnalyser
//
//  Created by admin on 13/04/21.
//

import Foundation
struct IPLBatsmanCSV {
    
    var POS: String
    var playerName: String
    var matches: String
    var innings: String
    var NO: String
    var runs: Int
    var highScore: Int
    var batingAverage: Double
    var BF: String
    var strikeRate: Double
    var centuries: Int
    var halfCenturies: Int
    var fours: Int
    var sixes: Int
    init ( POS: String , playerName: String , matches: String ,innings: String,
           NO: String,runs: Int, highScore: Int ,batingAverage: Double,BF: String,
           strikeRate: Double,centuries: Int, halfCenturies: Int,fours: Int, sixes:Int ){
        self.POS = POS
        self.playerName = playerName
        self.matches = matches
        self.innings = innings
        self.NO = NO
        self.runs = runs
        self.highScore = highScore
        self.batingAverage = batingAverage
        self.BF = BF
        self.strikeRate =  strikeRate
        self.centuries = centuries
        self.halfCenturies = halfCenturies
        self.fours = fours
        self.sixes = sixes   }
    
}
