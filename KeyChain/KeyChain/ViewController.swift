//
//  ViewController.swift
//  KeyChain
//
//  Created by admin on 22/04/21.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButton(_ sender: Any) {
        let keychain = KeychainSwift()
        let password = keychain.get("password")
        let passwordCheck = passwordTextField?.text
        if passwordCheck == password {
            print("Login SuccessFully")
            performSegue(withIdentifier: "login", sender: Any?.self)
        }else{
            print("The password is not correct")
        }
        
    }
    
    @IBAction func addPassword(_ sender: Any) {
        shouldPerformSegue(withIdentifier: "addPassword", sender: (Any).self)
    }
}

