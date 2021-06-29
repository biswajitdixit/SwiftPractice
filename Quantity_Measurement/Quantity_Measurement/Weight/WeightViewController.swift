//
//  WeightViewController.swift
//  Quantity_Measurement
//
//  Created by admin on 04/04/21.
//

import UIKit

class WeightViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var weightPicker: UIPickerView!
    @IBOutlet weak var weightOutput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    let list = UnitWeight.allCase()
    override func viewDidLoad() {
        super.viewDidLoad()
        weightPicker.delegate = self
        weightPicker.dataSource = self
    }
    
    @IBAction func convertWeightUnit(_ sender: Any) {
        let fromUnitIdx = weightPicker.selectedRow(inComponent: 0)
        let toUnitIdx = weightPicker.selectedRow(inComponent: 1)
                
                let fromUnit = UnitWeight.fromString(list[fromUnitIdx])!
                let toUnit = UnitWeight.fromString(list[toUnitIdx])!
                
                if let inputText = weightInput.text {
                    if !inputText.isEmpty {
                        let inputNum = Double(inputText)!
                        let outputNum = fromUnit.convertTo(unit: toUnit, value: inputNum)
                        weightOutput.text = String(outputNum)
                    }
                }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 2
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return list.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return list[row]
       }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
