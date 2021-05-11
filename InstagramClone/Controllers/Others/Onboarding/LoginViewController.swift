//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by vivek shrivastwa on 10/05/21.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    //MARK:- variables
    private let usernameEmailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username or Email..."
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
    
    private let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    private let registerButton:UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account.", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        return button
    }()
    
    private let privacyPolicyButton:UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let termButton:UIButton = {
        let button = UIButton()
        button.setTitle("Terms & Conditions", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let headerView:UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let instagramBackImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named:"instagramBackground")
        imageView.image = image
        return imageView
    }()
    
    private let instagramLogoImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named:"instagramLogo")
        imageView.image = image
        return imageView
    }()
    
    //MARK:- view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view background color
        view.backgroundColor = .systemBackground
        
        //adding all subviews
        addSubviews()
        
        //textfield delegate
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        //buttonAction
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        termButton.addTarget(self, action: #selector(termButtonTapped), for: .touchUpInside)
        privacyPolicyButton.addTarget(self, action: #selector(privacyPloicyButtonTapped), for: .touchUpInside)
    }
    
    //MARK:- adding subviews
    public func addSubviews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(privacyPolicyButton)
        view.addSubview(termButton)
        view.addSubview(registerButton)
        view.addSubview(headerView)
        headerView.addSubview(instagramBackImage)
        instagramBackImage.addSubview(instagramLogoImage)
    }
    
    //MARK:- view did layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //adding frames
        headerView.frame = CGRect(
            x:0,
            y: 0,
            width: view.width,
            height: 300)
        
        usernameEmailField.frame = CGRect(
            x: view.left + 20,
            y: headerView.bottom + 25,
            width:view.width - 40,
            height: 52)
        
        passwordField.frame = CGRect(
            x: view.left + 20,
            y: usernameEmailField.bottom + 10,
            width:view.width - 40,
            height: 52)
        
        loginButton.frame = CGRect(
            x: view.left + 20,
            y: passwordField.bottom + 25,
            width:view.width - 40,
            height: 52)
        
        registerButton.frame = CGRect(
            x: view.left + 20,
            y: loginButton.bottom + 10,
            width:view.width - 40,
            height: 52)
        
        termButton.frame = CGRect(
            x: view.left + 25,
            y: view.bottom - 70,
            width: view.width / 2 - 40,
            height: 52)
        
        privacyPolicyButton.frame = CGRect(
            x: view.left + view.width / 2 ,
            y: view.bottom - 70,
            width: view.width / 2 - 40,
            height: 52)
        
        instagramLogoImage.frame = CGRect(
            x: view.left + 50,
            y: headerView.top + 100,
            width: view.width - 100,
            height: 150)
        
        instagramBackImage.frame = headerView.bounds
    }
    
    //MARK:- action functions
    @objc func loginButtonTapped(){
        print("login button tapped")
        usernameEmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else { return }
        
        //login functionality
        var email:String?
        var username:String?
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            email = usernameEmail
        }
        else {
            username = usernameEmail
        }
        AuthManager.shared.login(username: username, email: email, password: password, completion: { success in
            DispatchQueue.main.async {
                if success {
                    //login successed
                    self.dismiss(animated: true, completion: nil)
                }
                else{
                    //login failed
                    let alert = UIAlertController(title: "Login Error",
                                                  message: "We were unable to log you in.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .cancel,
                                                  handler: nil))
                    self.present(alert, animated: true)
                }
            }
        })
    }
    @objc func createAccountButtonTapped(){
        let registerVC = RegisterViewController()
        let nav = UINavigationController(rootViewController: registerVC)
        registerVC.title = "Create Account"
        present(nav, animated: true)
    }
    @objc func privacyPloicyButtonTapped(){
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    @objc func termButtonTapped(){
        guard let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    
}


//MARK:- extension
extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            loginButtonTapped()
        }
        return true
    }
}
