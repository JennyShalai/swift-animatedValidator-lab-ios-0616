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
        print("Text Field Email")
        if validateEmail(emailTextField.text) {
            print("GOOD EMAIL")
        } else {
            animationFlashingField(emailTextField)
        }
        
    }
    
    @IBAction func textFieldEmailConformationEditingDidEnd(sender: AnyObject){
        print("text field email conformation")
        if validateEmail(emailConfirmationTextField.text) && validateConformationEmail(emailConfirmationTextField.text) {
            submitButton.enabled = true
            print("GOOD 2d EMAIL")
        } else {
            animationFlashingField(emailConfirmationTextField)
        }
        
    }
    
    @IBAction func textFieldPhoneEditingDidEnd(sender: AnyObject) {
        print("text field phone")
        if validatePhoneNumber(phoneTextField.text) {
            print("GOOD PHONE")
        } else {
            animationFlashingField(phoneTextField)
        }
    }
    
    @IBAction func passwordTextFielsEditingDidEnd(sender: AnyObject) {
        print("text field password")
        if validatePassword(passwordTextField.text) {
            print("GOOD PASSWORD")
        } else {
            animationFlashingField(passwordTextField)
        }
    }
    
    @IBAction func passwordConfirmationTextFieldEditingDidEnd(sender: AnyObject) {
        print("text field conformation password")
        if validateConfirmationPassword(passwordConfirmTextField.text) {
           print("GOOD CONF PASSWORD")
        } else {
            animationFlashingField(passwordConfirmTextField)
        }
    }
    
    /////////////////////     Validations     ///////////////////////////////
    func validateConfirmationPassword(password: String?) -> Bool {
        var result = false
        if validatePassword(password) &&
            passwordTextField.text != nil &&
                passwordConfirmTextField.text != nil &&
                    passwordTextField.text == passwordConfirmTextField.text {
            result = true
        }
        return result
    }
   
    func validatePassword(password: String?) -> Bool {
        var result = false
        if let password = password {
            if password.characters.count > 5 {
                result = true
            }
        }
        return result
    }
    
    func validatePhoneNumber(phone: String?) -> Bool {
        var result = false
        if phone != nil {
            let number = Int(phone!)
            if number != nil && phone?.characters.count > 6 {
                result = true
            }
        }
        return result
    }
    
    func validateConformationEmail(email: String?) -> Bool {
        var result = false
        if emailTextField.text == email {
            result = true
        }
        return result
    }
    
    func validateEmail(email: String?) -> Bool {
        var result = false
        if let email = email {
            if email.containsString("@") && email.containsString(".") {
                result = true
            }
        }
        return result
    }
    
    func animationFlashingField(textfieldID: UITextField) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            textfieldID.backgroundColor = UIColor.redColor()
            self.view.layoutIfNeeded()
        }) { (true) in
            textfieldID.backgroundColor = UIColor.whiteColor()
        
        }
    }

    
    
    
    
    
}