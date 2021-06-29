//
//  AddPasswordViewController.swift
//  KeyChain
//
//  Created by admin on 22/04/21.
//

import UIKit
import  KeychainSwift

class AddPasswordViewController: UIViewController {
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var controlpasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePasswordTapped(_ sender: Any) {
        let keyChain = KeychainSwift()
        let password = passwordTxtField.text
        let controllpassword = controlpasswordTextField.text
        if password == controllpassword {
            keyChain.set(password!, forKey: "password")
            dismiss(animated: true, completion: nil)
        }else{
            print("Password don't match ")
        }
    }
   

}
