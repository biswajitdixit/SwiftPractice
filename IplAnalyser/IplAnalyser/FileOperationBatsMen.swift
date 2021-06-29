//
//  FileOperationBatsMen.swift
//  IplAnalyser
//
//  Created by admin on 13/04/21.
//

import Foundation
class FileOperationBatsMen {
    
    func readDataFromFile(fileName:String, fileExtension: String) -> [IPLBatsmanCSV] {
        let fileURLProject = Bundle.main.path(forResource: fileName, ofType: fileExtension)
        var readStringHello = ""
        
        do {
            readStringHello = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        let line = readStringHello.split(separator: "\r\n")
        var iplBatsMenList = [IPLBatsmanCSV]()
        for elements in line {
        //    print(elements)
            let values = elements.split(separator:",")
          //  print(values)
            let ipl = IPLBatsmanCSV(POS: String(values[0]), playerName: String(values[1]), matches: String(values[2]), innings: String(values[3]) ,NO: String(values[4]), runs: Int(values[5]) ?? 0, highScore: Int(values[6]) ?? 0, batingAverage: Double(values[7]) ?? 0.0, BF: String(values[8]), strikeRate: Double(values[9]) ?? 0.0, centuries: Int(values[10]) ?? 0, halfCenturies: Int(values[11]) ?? 0, fours: Int(values[12]) ?? 0, sixes: Int(values[13]) ?? 0)
            iplBatsMenList.append(ipl)
            
        }
        
        return iplBatsMenList
    }
    
}
