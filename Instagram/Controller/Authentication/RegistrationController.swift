//
//  RegistrationController.swift
//  Instagram
//
//  Created by Elodie Cari on 9/28/22.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    
    private let fullnameTextField = CustomTextField(placeholder: "Fullname")
    
    private let usernameTextField = CustomTextField(placeholder: "Username")
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 5
        button.setHeight(50)
        return button
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Already have an account? Sign in", for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        configureUI()
    }
    
    func configureUI() {
        configureGradientLayer()
        view.addSubview(plusButton)
        plusButton.centerX(inView: view)
        plusButton.setDimensions(height: 140, width: 140)
        plusButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(
            top: plusButton.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 32,
            paddingLeft: 32,
            paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }

}
