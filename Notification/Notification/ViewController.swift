//
//  ViewController.swift
//  Notification
//
//  Created by admin on 05/06/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped() {
        NotificationCenter.default.post(name:Notification.Name("colorChanged"), object: nil)
        //view.backgroundColor = .red
    }
}
                
