import UIKit

class AddEmailViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        emailTextField.becomeFirstResponder()
    }
    
    @IBAction func emailTextFieldDidChangeEditing(_ sender: UITextField) {
        guard let text = sender.text else {
            return
        }
        
        nextButton.isEnabled = text.contains("@") && text.contains(".")
    }
}
