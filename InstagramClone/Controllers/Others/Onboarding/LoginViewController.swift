//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by vivek shrivastwa on 10/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    //constants
    struct Constants {
        static let cornerRadius:CGFloat = 8.0
        static let borderWidth:CGFloat = 2.0
    }

    //variables
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
        return textField
    }()
    
    private let passwordField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0,y: 0, width: 20, height: 0))
        textField.autocapitalizationType = .none // do not capitalize text auto
        textField.autocorrectionType = .no //do not correct text auto
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
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
        button.setTitle("Terms", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let termButton:UIButton = {
       let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        //adding all subviews
        addSubviews()
    }

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
    
    @objc func loginButtonTapped(){}
    @objc func createAccountButtonTapped(){}
    @objc func privacyPloicyButtonTapped(){}
    @objc func termButtonTapped(){}
    
}

