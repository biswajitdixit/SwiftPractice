//
//  TempViewController.swift
//  Quantity_Measurement
//
//  Created by admin on 04/04/21.
//

import UIKit

class TempViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UITextField!
    let list = UnitTemperature.allCase()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
    }
    

    @IBAction func convertTempUnit(_ sender: Any) {
        let fromUnitIdx = picker.selectedRow(inComponent: 0)
        let toUnitIdx = picker.selectedRow(inComponent: 1)
                
                let fromUnit = UnitTemperature.fromString(list[fromUnitIdx])!
                let toUnit = UnitTemperature.fromString(list[toUnitIdx])!
                
                if let inputText = input.text {
                    if !inputText.isEmpty {
                        let inputNum = Double(inputText)!
                        let outputNum = fromUnit.convertTo(unit: toUnit, value: inputNum)
                        output.text = String(outputNum)
                    }
                }       }
    @IBOutlet weak var picker: UIPickerView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 2
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return list.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return list[row]
       }
 

}
