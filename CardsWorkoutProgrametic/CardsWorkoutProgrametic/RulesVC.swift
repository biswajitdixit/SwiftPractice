
import UIKit

class RulesVC: UIViewController {
    
    let titleLable = UILabel()
    let rulesLable = UILabel()
    let exerciseLable = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLable()
        configureRuleLable()
        configureExerciseLable()
    }
    
    
    func configureTitleLable(){
        view.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = "Rules"
        titleLable.font = .systemFont(ofSize: 40, weight: .bold)
        titleLable.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ])
    }
    
    
    func configureRuleLable(){
        view.addSubview(rulesLable)
        rulesLable.translatesAutoresizingMaskIntoConstraints = false
        rulesLable.text = "The value of each card represents the number of exercise you do .\n\nJ = 11, Q = 12, K =13, A = 14"
        rulesLable.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLable.textAlignment = .center
        rulesLable.lineBreakMode = .byWordWrapping
        rulesLable.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            rulesLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 25),
            rulesLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ])
    }
    
    
    func configureExerciseLable(){
        view.addSubview(exerciseLable)
       exerciseLable.translatesAutoresizingMaskIntoConstraints = false
       exerciseLable.text = "♠️ = Push-ups\n\n❤️ = Sit-up\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks"
       exerciseLable.font = .systemFont(ofSize: 19, weight: .semibold)
       exerciseLable.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            exerciseLable.topAnchor.constraint(equalTo: rulesLable.bottomAnchor, constant: 25),
            exerciseLable.widthAnchor.constraint(equalToConstant: 200),
            exerciseLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
    
    
}
