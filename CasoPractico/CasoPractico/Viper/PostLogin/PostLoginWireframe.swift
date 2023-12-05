//
//  PostLoginWireframe.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PostLoginWireframe {
    private var view: PostLoginViewController?
    private var presenter: PostLoginPresenter?
    private var interactor: PostLoginInteractor?
    private var window: UIWindow?
    private var navigation: UINavigationController?

    init(in window: UIWindow?, users:[results] ) {
        self.view = PostLoginViewController()
        self.presenter = PostLoginPresenter()
        self.interactor = PostLoginInteractor()
        
        self.view?.eventHandler = self.presenter
        self.interactor?.output = self.presenter
        self.presenter?.view = self.view
        self.view?.users = users
        self.presenter?.provider = self.interactor
        self.presenter?.wireframe = self
        self.window = window
        self.navigation = self.window!.rootViewController as? UINavigationController
    }
    
    
    func pushPostView(animated: Bool) {
        navigation?.pushViewController(view!, animated: animated)
    }


}

