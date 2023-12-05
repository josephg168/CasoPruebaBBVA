//
//  LoginPresenter.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class LoginPresenter {

    weak var view: LoginView?
    var provider: LoginProvider?
    var wireframe: LoginWireframe?

}

// MARK: - Extensions - Ejecuta en el presenter los llamados del View Controller
extension LoginPresenter: LoginEventHandler {
    func callService(language: String, users: String){
        provider?.serviceRandom(language: language, users: users)
    }
    func pushPostView(users : [results]){
        wireframe?.showPostLoginView(users : users)
    }
}

// MARK: - Extensions - Ejecuta en el presenter los llamados del Interactor
extension LoginPresenter: LoginOutput {
    func getUser(result : results, allUsers : [results]) {
        view?.checkLogin(user: result.login?.username ?? "", pass: result.login?.password ?? "", users: allUsers)
    }
}
