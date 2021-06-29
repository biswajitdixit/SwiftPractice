//
//  IPLBowlerOutPut.swift
//  IplAnalyser
//
//  Created by admin on 14/04/21.
//

import Foundation

public class BowlerOutPut {
    var players : [IPLBowlerCSV] = []
    
    func loadData(){
        let fileOperationBowler = FileOperationBowler()
        players = fileOperationBowler.readDataFromFileBowler(fileName: "MostWktsFile", fileExtension: "csv")
    }
    
    
    func sortBowlingAvg() -> IPLBowlerCSV {
        players = players.sorted(by: {$0.average > $1.average})
        return players[0]
        
    }
    
    func sortByStrikingRate() -> IPLBowlerCSV {
        players = players.sorted(by: {$0.strikeRate > $1.strikeRate})
        return players[0]
        
    }
    
    func sortByBestEconomy() ->IPLBowlerCSV {
        players = players.sorted(by: {$0.Economy > $1.Economy})
        return players[0]
    }
    
    func sortByStrike5w4w() ->IPLBowlerCSV {
        players = players.sorted(by: {$0.fiveWickets + $0.fourWickets > $1.fiveWickets + $1.fourWickets && $0.strikeRate > $1.strikeRate})
        return players[0]
    }
    
    func sortByAvgAndStrikingRate() -> IPLBowlerCSV{
        players = players.sorted(by: {$0.average > $1.average && $0.strikeRate > $1.strikeRate })
        return players[0]
        
    }
    
    func sortByMaxWicketAndavg() -> IPLBowlerCSV {
        players = players.sorted(by: {$0.totalWickets > $1.totalWickets && $0.average > $1.average })
       return players[0]
    }
    
    func sortByMaxrunAndWicket() -> IPLBowlerCSV {
        players = players.sorted(by: {$0.runs > $1.runs  &&  $0.totalWickets > $1.totalWickets })
       return players[0]
    }
    
    
}
