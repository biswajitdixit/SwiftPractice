//
//  ViewController.swift
//  Animation
//
//  Created by admin on 06/05/21.
//

import UIKit

class ViewController: UIViewController {
    let layer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        layer.backgroundColor = UIColor.systemGreen.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        view.layer.addSublayer(layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            self.animateMovement()
        }
    }

    func animateMovement(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.size.width/2), y: layer.frame.origin.y + (layer.frame.size.height/2))
        animation.toValue = CGPoint(x: 300, y:400)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey:nil)
        
    }
}

