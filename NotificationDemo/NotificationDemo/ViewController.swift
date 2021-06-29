//
//  ViewController.swift
//  NotificationDemo
//
//  Created by admin on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(facebook(notification:)), name: .facebook, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(twitter(notification:)), name: .twitter, object: nil)
    }
    @objc func facebook(notification:Notification){
        lbl.text = "Facebook"
        img.image = #imageLiteral(resourceName: "facebook")
    }
    @objc func twitter(notification:Notification){
        lbl.text = "Twitter"
        img.image = #imageLiteral(resourceName: "twitter")
        
    }
    @IBAction func btn(_ sender: Any) {
        let secondvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(secondvc, animated: true)
    }
    
}
extension Notification.Name{
    static let facebook = Notification.Name("Facebook")
    static let twitter = Notification.Name("Twitter")
    
}
