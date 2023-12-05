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
        btn.layer.borderColor = UIColor(hex: "7BE0AD").cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor(hex: "7BE0AD")
        btn.setTitle(NSLocalizedString("textLogin", comment: ""), for: .normal)
        btn.titleLabel?.font =  .boldSystemFont(ofSize: 16)
        btn.setTitleColor(.black, for: .normal)
        btn.isUserInteractionEnabled = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return btn
    }()
    
    var labelTitleLogin : UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = UIColor(hex: "E0B0D5")
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "LOGIN"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.backgroundColor = UIColor(hex: "E7E5E5")
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
        
        view.addSubview(labelTitleLogin)
        labelTitleLogin.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        labelTitleLogin.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelTitleLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelTitleLogin.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(userTextField)
        userTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
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

extension UIColor {
    public convenience init(hex: String) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 1
        
        let hexColor = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        var valid = false
        
        if scanner.scanHexInt64(&hexNumber) {
            if hexColor.count == 8 {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                valid = true
            }
            else if hexColor.count == 6 {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
                valid = true
            }
        }
        
#if DEBUG
        assert(valid, "UIColor initialized with invalid hex string")
#endif
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
