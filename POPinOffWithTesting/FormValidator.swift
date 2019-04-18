import Foundation

protocol FormValidator {
    func formContentsAreValid(_ contents: [String]) -> Bool
}

struct AddEmailFormValidator: FormValidator {
    
    private let emailPattern = #"[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+"#
    
    func formContentsAreValid(_ contents: [String]) -> Bool {
        let email = contents.first ?? ""
        let regex = try! NSRegularExpression(pattern: emailPattern,
                                             options: .anchorsMatchLines)
        let entireString = NSRange(0..<email.count)
        let numberOfMatches = regex.numberOfMatches(in: email,
                                                    options: .anchored,
                                                    range: entireString)
        return numberOfMatches == 1
    }
}
