//
//  PostLoginPresenter.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class PostLoginPresenter {

    weak var view: PostLoginView?
    var provider: PostLoginProvider?
    var wireframe: PostLoginWireframe?

}

// MARK: - Extensions - Ejecuta en el presenter los llamados del View Controller
extension PostLoginPresenter: PostLoginEventHandler {
    
}

// MARK: - Extensions - Ejecuta en el presenter los llamados del Interactor
extension PostLoginPresenter: PostLoginOutput {
    
}
