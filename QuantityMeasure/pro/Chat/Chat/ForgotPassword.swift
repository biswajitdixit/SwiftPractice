
import UIKit
import ProgressHUD

class ForgotPassword: UIViewController {

   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButtonOutlet.layer.cornerRadius = 15
    }
    

    @IBAction func resetPasswordButton(_ sender: Any) {
        if emailTextField.text != "" {
            dismiss(animated: true, completion: nil)
        }else{
            ProgressHUD.showFailed("Enter the email id")
        }
       
    }
   

}
