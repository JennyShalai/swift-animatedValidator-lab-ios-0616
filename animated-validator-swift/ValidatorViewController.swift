//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.enabled = false
    }
    
    /////////////////////     IBActions     ///////////////////////////////
    
    @IBAction func textFieldEmailEditingDidEnd(sender: AnyObject) {
        if let email = self.emailTextField.text {
            if !self.isValid("email", string: email) {
                self.animateTextField(self.emailTextField)
            }
        }
    }
    
    @IBAction func textFieldEmailConfirmationEditingDidEnd(sender: AnyObject){
        if let emailConfirm = self.emailConfirmationTextField.text {
            if !self.isValid("emailConfirm", string: emailConfirm) {
                self.animateTextField(self.emailConfirmationTextField)
            }
        }
    }
    
    @IBAction func textFieldPhoneEditingDidEnd(sender: AnyObject) {
        if let phone = self.phoneTextField.text {
            if !isValid("phone", string: phone) {
                self.animateTextField(self.phoneTextField)
            }
        }
    }
    
    @IBAction func passwordTextFielsEditingDidEnd(sender: AnyObject) {
        if let password = self.passwordTextField.text {
            if !isValid("password", string: password) {
                self.animateTextField(self.passwordTextField)
            }
        }
    }

    @IBAction func passwordConfirmationTextFieldEditingDidEnd(sender: AnyObject) {
        if let passwordConfirm = self.passwordConfirmTextField.text {
            if !isValid("passwordConfirm", string: passwordConfirm) {
                self.animateTextField(self.passwordConfirmTextField)
            }
        }
    }
    
    /////////////////////     Animation     ///////////////////////////////

    func animateTextField(textField: UITextField) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            textField.backgroundColor = UIColor.redColor()
            self.view.layoutIfNeeded()
        }) { (true) in
            textField.backgroundColor = UIColor.whiteColor()
        
        }
    }
    
    /////////////////////     Validations     ///////////////////////////////
    
    func isValid(type: String, string: String) -> Bool {
        
        switch type {
            
        case "email":
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
            return emailPredicate.evaluateWithObject(string)
            
        case "emailConfirm":
            return string == self.emailConfirmationTextField.text && string != ""
            
        case "phone":
            let phonePredicate = NSPredicate(format: "SELF MATCHES %@", "^\\d{3}-\\d{3}-\\d{4}$")
            return phonePredicate.evaluateWithObject(string)
            
        case "password":
            return string.characters.count > 6
            
        case "passwordConfirm":
            return string == self.passwordTextField.text && string != ""
            
        default:
            return false
        }
    }
    
    
    
    
    
}