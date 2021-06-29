//
//  ViewController.swift
//  localiZationDemo
//
//  Created by admin on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seg: UISegmentedControl!
    @IBOutlet weak var lblFname: UILabel!
    @IBOutlet weak var lblLname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func btnSegment(_ sender: UISegmentedControl) {
        if seg.selectedSegmentIndex == 0{
            self.languageChanged(strLan: "en")
        }else{
            self.languageChanged(strLan: "hi")
        }
    }
    func languageChanged(strLan: String){
        lblFname.text = "FirstNameKey".localizableString(loc: strLan)
        lblLname.text = "LastNameKey".localizableString(loc: strLan)
    }
}

extension String{
    func localizableString(loc: String) -> String{
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        
    }
}
