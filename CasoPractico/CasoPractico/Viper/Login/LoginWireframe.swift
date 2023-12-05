//
//  LoginWireframe.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class LoginWireframe {
    private var view: LoginViewController?
    private var presenter: LoginPresenter?
    private var interactor: LoginInteractor?
    private var window: UIWindow?
    private var navigation: UINavigationController?

    init(in window: UIWindow?) {
        self.view = LoginViewController()
        self.presenter = LoginPresenter()
        self.interactor = LoginInteractor()
        
        self.view?.eventHandler = self.presenter
        self.interactor?.output = self.presenter
        self.presenter?.view = self.view
        self.presenter?.provider = self.interactor
        self.presenter?.wireframe = self
        self.window = window
        self.navigation = self.window!.rootViewController as? UINavigationController
    }
    
    func showLoginView() {
        self.window?.rootViewController = UINavigationController(rootViewController: self.view!)
        self.window?.makeKeyAndVisible()
    }
    
    func showPostLoginView(users : [results]){
        let frame =  PostLoginWireframe(in: self.window, users: users)
        frame.pushPostView(animated: true)
    }
    
}

