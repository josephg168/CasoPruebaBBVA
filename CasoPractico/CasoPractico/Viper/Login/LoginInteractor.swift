//
//  LoginInteractor.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation

final class LoginInteractor: LoginProvider {
    weak var output: LoginOutput?
    
    func serviceRandom(language : String, users user: String) {
        let language = language
        let userNumber = user
        let jsonUrlString = "https://randomuser.me/api?results=\(userNumber)&seed=smartstc&nat=\(language)"
        let url = URL(string: jsonUrlString)
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            if let data = data {
                do {
                    
                    let decoder = JSONDecoder()
                    let infoJson = try decoder.decode(root.self, from: data)
                    self.output?.getUser(result: infoJson.results.first!, allUsers : infoJson.results)
        
                } catch let jsonErr {
                    print("Error serializing json:", jsonErr)
                }
            }
        }.resume()
    }
}
