//
//  FileOperationBowler.swift
//  IplAnalyser
//
//  Created by admin on 13/04/21.
//

import Foundation
class FileOperationBowler{
    func readDataFromFileBowler(fileName:String, fileExtension: String) -> [IPLBowlerCSV] {
        let fileURLProject = Bundle.main.path(forResource: fileName, ofType: fileExtension)
        var readStringHello = ""
    
        do {
            readStringHello = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        let line = readStringHello.split(separator: "\r\n")
        var iplBowlerList = [IPLBowlerCSV]()
        for elements in line {
            //    print(elements)
            let values = elements.split(separator:",")
            //  print(values)
            let ipl = IPLBowlerCSV(POS: String(values[0]), playerName: String(values[1]), matches: String(values[2]), innings: String(values[3]), overs: String(values[4]), runs: Int(values[5]) ?? 0, totalWickets: Int(values[6]) ?? 0, BBI: String(values[7]), average: Double(values[8]) ?? 0.0, Economy: Double(values[9]) ?? 0.0, strikeRate: Double(values[10]) ?? 0.0, fourWickets: Int(values[11]) ?? 0, fiveWickets: Int(values[12]) ?? 0)
            iplBowlerList.append(ipl)
        
        }
    
        return iplBowlerList
    }
}
    
