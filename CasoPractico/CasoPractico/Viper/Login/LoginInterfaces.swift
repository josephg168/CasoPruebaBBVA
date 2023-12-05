//
//  LoginInterfaces.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
// MARK: - Protocol - Funcines en las que el Presenter comparte datos con el View Controller
protocol LoginView: class {
    func checkLogin(user : String, pass : String, users : [results])
}
// MARK: - Protocol - Funciones en las que el View Controler al Presenter
protocol LoginEventHandler {
    func callService(language: String, users: String)
    func pushPostView(users : [results])
}
// MARK: - Protocol - Funciones que comunican al Presenter con el Interactos
protocol LoginProvider {
    func serviceRandom(language: String, users: String)
}
// MARK: - Protocol - Funciones en las que el Interactor envia datos al Presenter
protocol LoginOutput: class {
    func getUser(result : results, allUsers : [results])
    
}
