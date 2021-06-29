//
//  ViewController.swift
//  Task1
//
//  Created by admin on 24/06/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let width = UIScreen.main.bounds.size.width/4
        let height = UIScreen.main.bounds.size.height/4
        for outerIndex in 0...3 {
            let x = CGFloat(outerIndex) * width
            for iner in 0...3 {
                let colorView = UIView(frame: CGRect(x: x, y: CGFloat(iner) * height, width: width, height: height))
                colorView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
                view.addSubview(colorView)
            }
        }
        
        
    }
}







