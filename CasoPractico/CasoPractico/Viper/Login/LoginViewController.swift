//
//  LoginViewController.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Public properties -
    var eventHandler: LoginPresenter!
    
    var userTextField : UITextField = {
        let textField = UITextField()
        textField.font = .boldSystemFont(ofSize: 16)
        textField.tintColor = .black
        textField.placeholder = NSLocalizedString("userText", comment: "")
        textField.layer.borderWidth = 1
        let color = UIColor.gray
        textField.layer.borderColor = color.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var passTextField : UITextField = {
        let textField = UITextField()
        textField.font = .boldSystemFont(ofSize: 16)
        textField.tintColor = .black
        textField.placeholder = NSLocalizedString("passwordText", comment: "")
        textField.layer.borderWidth = 1
        let color = UIColor.gray
        textField.layer.borderColor = color.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var buttonLogin : UIButton = {
        let btn = UIButton(frame: .zero)
        let color = UIColor.green
        btn.layer.borderColor = color.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 20
        btn.backgroundColor = color
        btn.setTitle(NSLocalizedString("textLogin", comment: ""), for: .normal)
        btn.titleLabel?.font =  .boldSystemFont(ofSize: 16)
        btn.setTitleColor(.black, for: .normal)
        btn.isUserInteractionEnabled = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return btn
    }()
    
    var languageTextField : UITextField = {
        let textField = UITextField()
        textField.font = .boldSystemFont(ofSize: 16)
        textField.tintColor = .black
        textField.placeholder = NSLocalizedString("languageText", comment: "")
        textField.layer.borderWidth = 1
        let color = UIColor.gray
        textField.layer.borderColor = color.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var userNumberTextField : UITextField = {
        let textField = UITextField()
        textField.font = .boldSystemFont(ofSize: 16)
        textField.tintColor = .black
        textField.placeholder = NSLocalizedString("usersNumberText", comment: "")
        textField.layer.borderWidth = 1
        let color = UIColor.gray
        textField.layer.borderColor = color.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textFieldsLogin()
        btnLogin()
        textFieldService()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

// MARK: - Extensions -
extension LoginViewController: LoginView {
    
    func textFieldsLogin(){
        view.addSubview(userTextField)
        userTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        userTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        userTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(passTextField)
        passTextField.topAnchor.constraint(equalTo: userTextField.topAnchor, constant: 40).isActive = true
        passTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        passTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func btnLogin(){
        view.addSubview(buttonLogin)
        buttonLogin.topAnchor.constraint(equalTo: passTextField.topAnchor, constant: 60).isActive = true
        buttonLogin.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        buttonLogin.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonLogin.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func textFieldService() {
        view.addSubview(languageTextField)
        languageTextField.topAnchor.constraint(equalTo: buttonLogin.topAnchor, constant: 100).isActive = true
        languageTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        languageTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        languageTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(userNumberTextField)
        userNumberTextField.topAnchor.constraint(equalTo: languageTextField.topAnchor, constant: 40).isActive = true
        userNumberTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        userNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userNumberTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
        
    @objc func didTapLogin(sender: UIButton) {
        if userTextField.text == "" || passTextField.text == "" || languageTextField.text == "" || userNumberTextField.text == "" {
            emptyTextFieldAlert()
        } else {
            let lan = languageTextField.text ?? ""
            let user = userNumberTextField.text ?? ""
            eventHandler.callService(language: lan, users: user)
        }
    }
    
    
    func emptyTextFieldAlert (){
        let alert = UIAlertController(title: "Error", message: NSLocalizedString("emptyText", comment: ""), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("alertButton", comment: ""), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func badLoginAlert(){
        let alert = UIAlertController(title: "Error", message: NSLocalizedString("failLogin", comment: ""), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("alertButton", comment: ""), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkLogin(user : String, pass : String, users : [results]) {
        DispatchQueue.main.async {
            if user == self.userTextField.text && pass == self.passTextField.text {

                self.eventHandler?.pushPostView(users : users)
            } else {
                self.badLoginAlert()
            }
        }
    }
}
