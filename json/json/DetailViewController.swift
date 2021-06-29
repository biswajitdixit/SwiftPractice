

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var alpha2: UILabel!
    @IBOutlet weak var alpha3: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var subregion: UILabel!
    
    var strRegion = ""
    var strSubRegion = ""
    var strAlpha2 = ""
    var strAlpha3 = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        alpha2.text = strAlpha2
        alpha3.text = strAlpha3
        region.text = strRegion
        subregion.text = strSubRegion

    }
    

   

}
