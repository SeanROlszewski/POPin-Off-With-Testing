import XCTest
@testable import POPinOffWithTesting

class AddEmailFormValidatorTests: XCTestCase {
    
    let subject = AddEmailFormValidator()
    
    func test_addEmailFormValidator_returnsFalseForEmptyContents() {
        XCTAssertFalse(subject.formContentsAreValid([""]))
        XCTAssertFalse(subject.formContentsAreValid([]))
    }
    
    func test_addEmailFormValidator_returnsFalseForSomethingIsNotAnEmailAddress() {
        XCTAssertFalse(subject.formContentsAreValid(["password"]))
        XCTAssertFalse(subject.formContentsAreValid(["one two three four"]))
        XCTAssertFalse(subject.formContentsAreValid(["123"]))
        XCTAssertFalse(subject.formContentsAreValid(["something @gmail.com"]))
        XCTAssertFalse(subject.formContentsAreValid(["something@ gmail.com"]))
    }
    
    func test_addEmailFormValidator_returnsTrueForAValidEmailAddress() {
        XCTAssertTrue(subject.formContentsAreValid(["something@gmail.com"]))
        XCTAssertTrue(subject.formContentsAreValid(["something11@gmail.com"]))
        XCTAssertTrue(subject.formContentsAreValid(["something@gmail11.com"]))
    }
}
