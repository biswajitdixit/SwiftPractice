import UIKit
import Firebase
import JGProgressHUD

protocol AuthenticationControllerProtocol {
    func checkFormStatus()
}

class LoginController:UIViewController{
    
    //Mark:- Properties
    private var viewModel = LoginViewModel()
    private let iconImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "bubble.right")
        imgView.tintColor = .white
        return imgView
    }()
    
    private lazy var emailContainerView: UIView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
         return InputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)

     
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handelLogin), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
       
    
    private let passwordTextField: CustomTextField = {
        let txtFld = CustomTextField(placeholder: "Password")
        txtFld.isSecureTextEntry = true
        return txtFld
    }()
    
    private let forgotPasswordButton:UIButton = {
        let button = UIButton(type: .system)
        let attributeTitle = NSMutableAttributedString(string: "Forgotten Password?",
                                                       attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white])
        button.setAttributedTitle(attributeTitle, for: .normal)
        button.addTarget(self, action: #selector(handelShowForgotPassword), for: .touchUpInside)
        return button
    }()
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributeTitle = NSMutableAttributedString(string: "Don't have an account?  ",
                                                       attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white])
        
        attributeTitle.append(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.white
                                                                                               
        ]))
        
        button.setAttributedTitle(attributeTitle, for: .normal)
        button.addTarget(self, action: #selector(handelShowSignUp), for: .touchUpInside)
        return button
    }()
    
    //Mark:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //Mark: - selector
    @objc func handelShowSignUp(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextField {
            viewModel.email = sender.text
        }else{
            viewModel.password = sender.text
        }
       checkFormStatus()
    }
    
   
    @objc func handelLogin(){
        guard let email = emailTextField.text else{return}
        guard let password = passwordTextField.text else{return}
        showLoader(true,withText: "Loggin in ")
        Auth.auth().signIn(withEmail: email, password: password){  authResult, error in
            if let e = error{
                print(e.localizedDescription)
                print("Person not yet Registered")
                self.showLoader(false)
                return
                
            }
            self.showLoader(false)
            self.dismiss(animated: true, completion: nil)
        }

    }
    
    @objc func handelShowForgotPassword(){
        let controller = ForgottenPassword()
        navigationController?.pushViewController(controller, animated: true)
    }
    //Mark: - Helper
    
  
    
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradiantLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top:view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton,forgotPasswordButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top:iconImage.bottomAnchor, left: view.leftAnchor,right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left:view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingBottom: 16,  paddingRight: 32)
        
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
}

extension LoginController: AuthenticationControllerProtocol {
    
    func checkFormStatus(){
        if viewModel.formIsValid{
            loginButton.isEnabled = true
            loginButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }else{
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
    }
}
