//
//  ViewController.swift
//  DEmo1
//
//  Created by admin on 21/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTapped(_ sender: Any) {
        guard let dashBoardVC = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashViewController") as? DashViewController else {return }
        self.present(dashBoardVC, animated: true, completion: nil)    }
    
}

