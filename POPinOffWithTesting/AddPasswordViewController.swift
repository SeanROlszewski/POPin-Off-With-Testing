import UIKit

class AddPasswordViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        passwordTextField.becomeFirstResponder()
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        guard let passwordText = passwordTextField.text,
            let confirmPasswordText = confirmPasswordTextField.text else {
                    return
        }
        
        nextButton.isEnabled = passwordText == confirmPasswordText && passwordText.count >= 8
    }
}

