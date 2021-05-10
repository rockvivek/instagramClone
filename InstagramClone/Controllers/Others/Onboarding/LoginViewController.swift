//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by vivek shrivastwa on 10/05/21.
//

import UIKit

class LoginViewController: UIViewController {

    //variables
    private let usernameEmailField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let passwordField:UITextField = {
        let password = UITextField()
        password.isSecureTextEntry = true
        return password
    }()
    
    private let loginButton:UIButton = {
       let button = UIButton()
        return button
    }()
    private let registerButton:UIButton = {
       let button = UIButton()
        return button
    }()
    
    private let privacyPolicyButton:UIButton = {
       let button = UIButton()
        return button
    }()
    
    private let termButton:UIButton = {
       let button = UIButton()
        return button
    }()
    
    private let headerView:UIView = {
        let view = UIView()
        return view
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
        view.addSubview(headerView)
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    @objc func loginButtonTapped(){}
    @objc func createAccountButtonTapped(){}
    @objc func privacyPloicyButtonTapped(){}
    @objc func termButtonTapped(){}
    
}

