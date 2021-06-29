//
//  ViewController.swift
//  Gif
//
//  Created by admin on 27/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleTXt: UITextField!
    
    @IBOutlet weak var gifUrlTxt: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn.layer.cornerRadius = 15
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        Service.addGif(gifUrlTxt.text!, title: titleTXt.text!)
        openAlert(title: "Alert", message: "Gif Added Successfully", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
            print("Okay clicked!")
            self.titleTXt.text = nil
            self.gifUrlTxt.text = nil
            
        }])
        
    }
}

