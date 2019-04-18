import UIKit

class AddEmailViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    lazy var formValidator: FormValidator = AddEmailFormValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        emailTextField.becomeFirstResponder()
    }
    
    @IBAction func emailTextFieldDidChangeEditing(_ sender: UITextField) {
        nextButton.isEnabled = formValidator.formContentsAreValid([sender.text ?? ""])
    }
}
