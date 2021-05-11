//
//  RegisterViewController.swift
//  InstagramClone
//
//  Created by vivek shrivastwa on 10/05/21.
//

import UIKit

class RegisterViewController: UIViewController {

    //MARK:- variables
    private let usernameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username..."
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.autocapitalizationType = .none // do not capitalize text auto
        textField.autocorrectionType = .no //do not correct text auto
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.borderWidth = 1.0
        return textField
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Id..."
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.autocapitalizationType = .none // do not capitalize text auto
        textField.autocorrectionType = .no //do not correct text auto
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.borderWidth = 1.0
        return textField
    }()
    
    private let passwordField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.returnKeyType = .continue
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0,y: 0, width: 20, height: 0))
        textField.autocapitalizationType = .none // do not capitalize text auto
        textField.autocorrectionType = .no //do not correct text auto
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.borderWidth = 1.0
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let signupButton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    //MARK:- view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //add subviews
        addSubviews()
        
        //MARK:- text field delegate
        emailField.delegate = self
        passwordField.delegate = self
        usernameField.delegate = self
        
        //add action to button
        signupButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    //MARK:- add subview
    public func addSubviews(){
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signupButton)
    }
    
    //MARK:- view did layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //frame
        usernameField.frame = CGRect(x: 20,
                                     y: view.top - view.safeAreaInsets.top + 170,
                                     width: view.width - 40,
                                     height: 52)
        emailField.frame = CGRect(x: 20,
                                  y: usernameField.bottom + 10,
                                     width: view.width - 40,
                                     height: 52)
        passwordField.frame = CGRect(x: 20,
                                     y: emailField.bottom + 10,
                                     width: view.width - 40,
                                     height: 52)
        signupButton.frame = CGRect(x: 20,
                                     y: passwordField.bottom + 30,
                                     width: view.width - 40,
                                     height: 52)
        
    }
    
    //MARK:- signup button action
    @objc func signUpButtonTapped(){
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let username = usernameField.text, !username.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        //signup logic
        AuthManager.shared.register(username: username, email: email, password: password){ success in
            if success {
                print("user created")
            }
            else{
                print("some error occured")
            }
        }
    }
}

//MARK:- extension
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            textField.resignFirstResponder()
        }
        else if textField == emailField {
            textField.resignFirstResponder()
        }
        else if textField == passwordField {
            signUpButtonTapped()
        }
        return true
    }
}
