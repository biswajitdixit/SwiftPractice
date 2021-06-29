

import UIKit

class CardSelectionVc: UIViewController {
    
    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, tittle: "Stop!")
    let resetButton = CWButton(backgroundColor: .systemGreen, tittle: "Reset")
    let ruleButton = CWButton(backgroundColor: .systemBlue, tittle: "Rule")
    
    var cards = CardDeck.allValues
    var timer:Timer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        ConfigureUI()
        startTimer()
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomcard), userInfo: nil, repeats: true)
    }
    
    
    @objc func stopTimer(){
        timer.invalidate()
        
    }
    
    @objc func resettimer(){
        stopTimer()
        startTimer()
    }
    
    
    @objc func showRandomcard(){
        cardImageView.image = cards.randomElement()
    }
    
    
    func ConfigureUI(){
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRuleButton()
    }
    
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -75)
        ])
        
    }
    
    
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant:  260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resettimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
            
            
        ])
    }
    
    
    func configureRuleButton(){
        view.addSubview(ruleButton)
        
        ruleButton.addTarget(self, action: #selector(presentAViewController), for: .touchUpInside)
        NSLayoutConstraint.activate([
            ruleButton.widthAnchor.constraint(equalToConstant: 115),
            ruleButton.heightAnchor.constraint(equalToConstant: 50),
            ruleButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            ruleButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    
    @objc func presentAViewController(){
        present(RulesVC(), animated: true)
        
    }
    
}
