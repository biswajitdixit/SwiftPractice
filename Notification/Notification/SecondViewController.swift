//
//  SecondViewController.swift
//  Notification
//
//  Created by admin on 05/06/21.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(notificationRecived), name: Notification.Name("colorChanged"), object: nil)
    }
    
    @objc func notificationRecived(){
        view.backgroundColor = .red
    }
    
}
