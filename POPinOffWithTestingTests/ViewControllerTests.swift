import XCTest
@testable import POPinOffWithTesting

class FormValidatorStub: FormValidator {
    var formContentsAreValid: Bool!
    
    func formContentsAreValid(_ contents: [String]) -> Bool {
        return formContentsAreValid
    }
}

class POPinOffWithTestingTests: XCTestCase {
    var addEmailViewController: AddEmailViewController!
    var formValidatorStub: FormValidatorStub!
    
    override func setUp() {
        formValidatorStub = FormValidatorStub()
        
        addEmailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddEmailViewController") as? AddEmailViewController
        addEmailViewController.loadViewIfNeeded()
        addEmailViewController.formValidator = formValidatorStub
    }
    
    func test_addEmailViewController_invalidFormDisablesButton() {
        formValidatorStub.formContentsAreValid = false
        
        addEmailViewController.emailTextFieldDidChangeEditing(UITextField())
        
        XCTAssertFalse(addEmailViewController.nextButton.isEnabled)
    }
    
    func test_addEmailViewController_validFormEnablesButton() {
        formValidatorStub.formContentsAreValid = true
        
        addEmailViewController.emailTextFieldDidChangeEditing(addEmailViewController.emailTextField)

        XCTAssert(addEmailViewController.nextButton.isEnabled)
    }
}
