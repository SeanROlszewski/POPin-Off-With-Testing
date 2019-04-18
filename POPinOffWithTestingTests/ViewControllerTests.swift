import XCTest
@testable import POPinOffWithTesting

class POPinOffWithTestingTests: XCTestCase {

    var addEmailViewController: AddEmailViewController!
    var addPasswordViewController: AddPasswordViewController!
    
    override func setUp() {
        addEmailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddEmailViewController") as? AddEmailViewController
        addEmailViewController.loadViewIfNeeded()
        
        addPasswordViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddPasswordViewController") as? AddPasswordViewController
        addPasswordViewController.loadViewIfNeeded()
    }
    
    func test_addEmailViewController_emptyFormDisablesButton() {
        addEmailViewController.emailTextField.text = ""
        
        addEmailViewController.emailTextFieldDidChangeEditing(addEmailViewController.emailTextField)
        
        XCTAssertFalse(addEmailViewController.nextButton.isEnabled)
    }
    
    func test_addEmailViewController_formWithEmailCharactersEnablesButton() {
        addEmailViewController.emailTextField.text = "@."
        
        addEmailViewController.emailTextFieldDidChangeEditing(addEmailViewController.emailTextField)

        XCTAssert(addEmailViewController.nextButton.isEnabled)
    }
    
    func test_addPasswordViewController_emptyFormDisablesButton() {
        addPasswordViewController.passwordTextField.text = ""
        addPasswordViewController.confirmPasswordTextField.text = ""
        
        addPasswordViewController.textFieldEditingChanged(addPasswordViewController.passwordTextField)
        addPasswordViewController.textFieldEditingChanged(addPasswordViewController.confirmPasswordTextField)

        XCTAssertFalse(addPasswordViewController.nextButton.isEnabled)
    }
    
    func test_addPasswordViewController_formWithMatchingPasswordsOfRightLengthEnablesButton() {
        addPasswordViewController.passwordTextField.text = "password"
        addPasswordViewController.confirmPasswordTextField.text = "password"
        
        addPasswordViewController.textFieldEditingChanged(addPasswordViewController.passwordTextField)
        addPasswordViewController.textFieldEditingChanged(addPasswordViewController.confirmPasswordTextField)
        
        XCTAssert(addPasswordViewController.nextButton.isEnabled)
    }
}
