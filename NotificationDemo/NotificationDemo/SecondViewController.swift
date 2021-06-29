//
//  SecondViewController.swift
//  NotificationDemo
//
//  Created by admin on 26/04/21.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnFB(_ sender: Any) {
        NotificationCenter.default.post(name: .facebook, object: nil)
    }
    @IBAction func btnTwit(_ sender: Any) {
        NotificationCenter.default.post(name: .twitter, object: nil)
    }
    

}
