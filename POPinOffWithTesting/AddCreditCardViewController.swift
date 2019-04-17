import UIKit

class AddCreditCardViewController: UIViewController {

    @IBOutlet weak var creditCardNumberTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        creditCardNumberTextField.becomeFirstResponder()
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        guard let creditCardNumberText = creditCardNumberTextField.text,
            let cvvText = cvvTextField.text else {
                return
        }
        
        nextButton.isEnabled = [15, 16].contains(creditCardNumberText.count) &&
            [3, 4].contains(cvvText.count) &&
            CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: creditCardNumberText)) &&
            CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: cvvText))
    }
}

