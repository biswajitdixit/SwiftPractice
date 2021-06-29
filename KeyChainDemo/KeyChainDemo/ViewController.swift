//
//  ViewController.swift
//  KeyChainDemo
//
//  Created by admin on 22/04/21.
//

import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {

    @IBOutlet weak var txtLable: UILabel!
    @IBOutlet weak var inputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyChainData = KeychainWrapper.standard.string(forKey: "sampleKey")
        if keyChainData  != nil {
            txtLable.text = keyChainData
        }else{
            txtLable.text = "Input text here"
        }
    }
    @IBAction func buttonPressed(_ sender: Any) {
        txtLable.text = inputField.text
        KeychainWrapper.standard.set(inputField.text ?? "", forKey: "sampleKey")
    }
    

}

