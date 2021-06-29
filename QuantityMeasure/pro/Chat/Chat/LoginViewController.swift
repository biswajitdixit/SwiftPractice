import UIKit
import ProgressHUD

class LoginViewController:UIViewController {
    
    //Marks:- IBOutlets
    @IBOutlet weak var emailLabelOutlet: UILabel!
    @IBOutlet weak var passwordLabelOutlet: UILabel!
    @IBOutlet weak var repeatPasswordLabelOutlet: UILabel!
    @IBOutlet weak var signUpLabel: UILabel!
   
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    @IBOutlet var repeatPasswordLineView: UIView!
    
    var isLogin = true
    
    //Marks-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIFor(login: true)
        setupTextFieldDelegates()
    }
    
    //Marks:- IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: isLogin ? "login" : "register") {
            print(isLogin)
            isLogin ? loginUser() : registerUser()
        }else {
            ProgressHUD.showFailed("All Fields are required")
        }
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        updateUIFor(login: sender.titleLabel?.text == "Login")
        isLogin.toggle()
    }
    
    //Marks:- Selectors
    @objc func textFieldDidChange(_ textField: UITextField){
        updatePlaceholderLabels(textField: textField)
        print("Chainging text field")
    }
    
    
    //Marks:- Setup
    
    private func setupTextFieldDelegates(){
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    //Marks:- Animations
    
    private func updateUIFor(login: Bool){
        loginButtonOutlet.setImage(UIImage(named: login ? "loginBtn" : "registerBtn"), for: .normal)
        signUpButtonOutlet.setTitle(login ? "SignUp" : "Login", for: .normal)
        signUpLabel.text = login ? "Don't have an account ?" : "Have an account ?"
        UIView.animate(withDuration: 0.5) {
            self.repeatPasswordTextField.isHidden = login
            self.repeatPasswordLabelOutlet.isHidden = login
            self.repeatPasswordLineView.isHidden = login
        }
    }
    
    private func updatePlaceholderLabels(textField: UITextField){
        
        switch textField{
        case emailTextField:
            emailLabelOutlet.text = textField.hasText ? "Email" : ""
        case passwordTextField:
            passwordLabelOutlet.text = textField.hasText ? "Password" : ""
        default:
            repeatPasswordLabelOutlet.text = textField.hasText ? "Repeat Password" : ""
        }
    }
    
    //Marks:- Helper
    
    private func isDataInputedFor(type: String) -> Bool {
        
        switch type {
        case "login":
            return emailTextField.text != "" && passwordTextField.text != ""
        case "registration":
        return emailTextField.text != "" && passwordTextField.text != "" && repeatPasswordTextField.text != ""
        
        default:
            return emailTextField.text != ""
        }
    }
    
    private func registerUser(){
        if passwordTextField.text! == repeatPasswordTextField.text!{
            FirebaseUserListner.shared.registerUser(email: emailTextField.text!, password: repeatPasswordTextField.text!) { (error) in
                if error == nil {
                    ProgressHUD.showSuccess("User Sucessfully registered")
                }else{
                    ProgressHUD.showFailed(error!.localizedDescription)
                }
            }
        }else{
            ProgressHUD.showError("The Password don't match")
        }
    }
    
    private func loginUser(){
       print("login------------------------")
    }
}
