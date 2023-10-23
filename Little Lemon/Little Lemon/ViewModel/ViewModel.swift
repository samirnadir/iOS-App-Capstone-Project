//
//  SwiftUIView.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 28/09/2023.
//

import Foundation

class ViewModel : ObservableObject{
    
    @Published var showFormInvalidMessage : Bool = false
    @Published var errorMessage : String = ""
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    
    func validateForm(firstName: String ) -> Bool {
        
        let firstNameIsValid = isValid(name: firstName)
        guard firstNameIsValid else {
            var invalidFirstNameMessage = ""
            if firstName.isEmpty || !isValid(name: firstName) {
                invalidFirstNameMessage = "First Name can only contain letters and must have at least 3 characters\n\n"
            }
            
            self.errorMessage = "\n\n \(invalidFirstNameMessage)"
            showFormInvalidMessage.toggle()
            return false
        }
        return true
    }
    
    func validateForm(lastName: String ) -> Bool {
        
        let lastNameIsValid = isValid(name: lastName)
        guard lastNameIsValid else {
            var invalidLastNameMessage = ""
            if lastName.isEmpty || !isValid(name: lastName) {
                invalidLastNameMessage = "Last Name can only contain letters and must have at least 3 characters\n\n"
            }
            
            self.errorMessage = "\n\n \(invalidLastNameMessage)"
            showFormInvalidMessage.toggle()
            return false
        }
        return true
    }
    
    func validateForm(email: String ) -> Bool {
        
        let emailIsValid = isValid(email: email)
        guard emailIsValid
        else {
            var invalidEmailMessage = ""
            if email.isEmpty || !isValid(email: email) {
                invalidEmailMessage = "The e-mail is invalid and cannot be blank.\n\n"
            }
            
            self.errorMessage = "\n\n \(invalidEmailMessage)"
            showFormInvalidMessage.toggle()
            return false
        }
        return true
    }
    
    func isValid(name: String) -> Bool {
        guard !name.isEmpty,name.count > 2
        else { return false }
        for chr in name {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z")) {
                return false
            }
        }
        return true
    }
    
    func isValid(email:String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
}
