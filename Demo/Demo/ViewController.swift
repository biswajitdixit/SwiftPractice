//
//  ViewController.swift
//  Demo
//
//  Created by admin on 21/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btntapped(_ sender: UIButton) {
      let storyboard = UIStoryboard(name: "SecondStory", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

