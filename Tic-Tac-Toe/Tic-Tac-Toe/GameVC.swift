
import UIKit

class GameVC: UIViewController {
   
    @IBOutlet weak var playerNameLbl: UILabel!
    @IBOutlet weak var playerScoreLbl: UILabel!
    @IBOutlet weak var computerScoreLbl: UILabel!
    
    @IBOutlet weak var box1: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    @IBOutlet weak var box3: UIImageView!
    @IBOutlet weak var box4: UIImageView!
    @IBOutlet weak var box5: UIImageView!
    @IBOutlet weak var box6: UIImageView!
    @IBOutlet weak var box7: UIImageView!
    @IBOutlet weak var box8: UIImageView!
    @IBOutlet weak var box9: UIImageView!
    
    var lastValue = "o"
    var playerChoices :[Box] = []
    var computerChoices :[Box] = []
    var playerName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerNameLbl.text = playerName
        createTap(on: box1, type: .one)
        createTap(on: box2, type: .two)
        createTap(on: box3, type: .three)
        createTap(on: box4, type: .four)
        createTap(on: box5, type: .five)
        createTap(on: box6, type: .six)
        createTap(on: box7, type: .seven)
        createTap(on: box8, type: .eight)
        createTap(on: box9, type: .nine)
        
        
    }
    

    @IBAction func closeBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func createTap(on imageView:UIImageView, type box: Box){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.boxClicked(_:)))
        tap.name = box.rawValue
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }

    
    @objc func boxClicked(_ sender: UITapGestureRecognizer){
        let selectedBox = getBox(from: sender.name ?? "")
        makeChoice(selectedBox)
        playerChoices.append(Box(rawValue: sender.name!)!)
        checkIfWon()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.computerPlay()
        }
        
    }
    
    
    func computerPlay(){
        var avilableSpaces = [UIImageView]()
        var avilableboxes = [Box]()
        for name in Box.allCases{
            let box = getBox(from: name.rawValue)
            if box.image == nil {
                avilableSpaces.append(box)
                avilableboxes.append(name)
            }
        }
        
        guard avilableboxes.count > 0 else {return}
        let randIndex = Int.random(in: 0 ..< avilableSpaces.count)
        makeChoice(avilableSpaces[randIndex])
        computerChoices.append(avilableboxes[randIndex])
        checkIfWon()
    }
    
    
    func makeChoice (_ selectedBox: UIImageView){
        guard selectedBox.image == nil else{
            return
        }
        if lastValue == "x"{
            selectedBox.image = #imageLiteral(resourceName: "o")
            lastValue = "o"
        }else{
            selectedBox.image = #imageLiteral(resourceName: "x")
            lastValue = "x"
        }
        
    }
    
    
    func checkIfWon(){
        var correct = [[Box]]()
        let firstRow:[Box] = [.one, .two, .three]
        let secondRow:[Box] = [.four, .five, .six]
        let thirdRow:[Box] = [.seven, .eight, .nine]
        
        let firstColoum:[Box] = [.one, .four, .seven]
        let secondColoum:[Box] = [.two, .five, .eight]
        let thirdColoum:[Box] = [.three, .six, .nine]
       
        let backwordSlash:[Box] = [.one, .five, .nine]
        let forwordSlash:[Box] = [.three, .five, .seven]
        
        correct.append(firstRow)
        correct.append(secondRow)
        correct.append(thirdRow)
        correct.append(firstColoum)
        correct.append(secondColoum)
        correct.append(thirdColoum)
        correct.append(backwordSlash)
        correct.append(forwordSlash)
        
        for valid in correct {
            let userMatch = playerChoices.filter {valid.contains($0)
            }.count
            let computerMatch = computerChoices.filter{valid.contains($0)
            }.count
            
            if userMatch == valid.count{
                playerScoreLbl.text = String((Int(playerScoreLbl.text ?? "0") ?? 0) + 1)
                resetGame()
                break
            }else if computerMatch == valid.count{
                computerScoreLbl.text =  String((Int(computerScoreLbl.text ?? "0") ?? 0) + 1)
                resetGame()
                break
            }else if computerChoices.count + playerChoices.count == 9 {
                resetGame()
                break
            }
        }
        
    }
    
    
    func resetGame(){
        for name in Box.allCases{
            let box = getBox(from: name.rawValue)
            box.image = nil
        }
        lastValue = "o"
        playerChoices = []
        computerChoices = []
    }
    
    
    func getBox(from name:String) -> UIImageView {
        let box = Box(rawValue: name) ?? .one
        
        switch box {
        case .one :
            return box1
        case .two :
            return box2
        case .three :
            return box3
        case .four :
            return box4
        case .five :
            return box5
        case .six :
            return box6
        case .seven :
            return box7
        case .eight :
            return box8
        case .nine :
            return box9
        }
    }
    
    
}

