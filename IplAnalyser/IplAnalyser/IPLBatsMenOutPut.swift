//
//  IPLBatsMenOutPut.swift
//  IplAnalyser
//
//  Created by admin on 13/04/21.
//

import Foundation
public class BatsMenOutPut {
    var players : [IPLBatsmanCSV] = []
    func loadData(){
        let fileOperationBatsMen = FileOperationBatsMen()
        players = fileOperationBatsMen.readDataFromFile(fileName:"MostRunsFile", fileExtension: "csv")
    }
    
    func sortByBattingAvg() -> IPLBatsmanCSV{
         players = players.sorted(by: {$0.batingAverage > $1.batingAverage})
         return players[0]
    }
    
    func sortByBatingStrike() -> IPLBatsmanCSV {
        players = players.sorted(by: {$0.strikeRate > $1.strikeRate})
        return players[0]
    }
    func sortByMax6_4() -> IPLBatsmanCSV {
   
        players = players.sorted(by: {$0.sixes + $0.fours > $1.sixes + $1.fours })
        return players[0]
        
    }
    func sortByBestStrikeAnd6_4() -> IPLBatsmanCSV {
        players = players.sorted(by: {$0.sixes + $0.fours > $1.sixes + $1.fours && $0.strikeRate > $1.strikeRate })
        return players[0]
        
    }
    
    func sortByAvgAndStrike() -> IPLBatsmanCSV {
        players = players.sorted(by: {$0.batingAverage > $1.batingAverage && $0.strikeRate > $1.strikeRate })
        return players[0]
    }
    
    func sortBymaxRunAndAvg() -> IPLBatsmanCSV{
        players = players.sorted(by: {$0.runs > $1.runs && $0.batingAverage > $1.batingAverage })
        return players[0]
    }
    
    func sortByMaxHundreedAndAng () -> IPLBatsmanCSV {
        players = players.sorted(by: {$0.centuries > $1.centuries && $0.batingAverage > $1.batingAverage })
        return players[0]
    }
    
   
        
    
}
