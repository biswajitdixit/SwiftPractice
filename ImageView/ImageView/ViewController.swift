//
//  ViewController.swift
//  ImageView
//
//  Created by admin on 25/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weidth: UILabel!
    var images:Image?
    override func viewDidLoad() {
        super.viewDidLoad()
        image.loadImageUsingCacheWithUrlString(images?.imageUrl ?? "")
        height.text = "Height = "+(images?.imageHeight)!+" c.m"
        weidth.text = "Weidth = "+(images?.imageWidth)!+" c.m"
        // Do any additional setup after loading the view.
    }

}
