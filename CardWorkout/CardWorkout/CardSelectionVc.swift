
import UIKit

class CardSelectionVc: UIViewController {

    @IBOutlet  var cardImageView: UIImageView!
    @IBOutlet var btns: [UIButton]!
    
    var timer: Timer!
    
    var cards:[UIImage] = Card.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for buttons in btns {
            buttons.layer.cornerRadius = 8
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    @IBAction func stopBtnTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartBtnTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
   
}
