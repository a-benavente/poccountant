//
//  ViewController.swift
//  Poccountant
//
//  Created by amanda on 11/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let topTitle = UILabel()
    let subtitle = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorLabel = UILabel()

    var username: String? {
        loginView.usernameTextField.text
    }
    var password: String? {
        loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    
    func style() {
        
        topTitle.translatesAutoresizingMaskIntoConstraints = false
        topTitle.text = "Poccountant"
        topTitle.textAlignment = .center
        topTitle.font = .boldSystemFont(ofSize: 35)
        
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = "Your premium source for tracking all things financial"
        subtitle.numberOfLines = 0
        subtitle.adjustsFontForContentSizeCategory = true
        subtitle.textAlignment = .center
        subtitle.font = UIFont.preferredFont(forTextStyle: .title2)
        
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textAlignment = .center
        errorLabel.textColor = .systemRed
        errorLabel.numberOfLines = 0
        errorLabel.text = "Incorrect username and/or password"
        errorLabel.isHidden = true
                
    }
    
    func layout() {
        view.addSubview(topTitle)
        view.addSubview(subtitle)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorLabel)
        
        
        //Title & Subtitle
        NSLayoutConstraint.activate([
            topTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitle.topAnchor.constraint(equalToSystemSpacingBelow: topTitle.bottomAnchor, multiplier: 3),
            subtitle.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitle.bottomAnchor, multiplier: 3),
        ])
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        //Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Error Warning
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("password or username should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(with: "Username/Password cannot be blank")
            return
        }
        
        if username == "Amanda" && password == "123" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(with: "Incorrect password or username")
        }
    }
    
    private func configureView(with message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}
