//
//  PostLoginViewController.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

final class PostLoginViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Public properties -
    var eventHandler: PostLoginPresenter!
    var users : [results]?
    var tableUsers : UITableView!
   
    var arrayFilteredChunked : [[results]] = []
    var arrayPage: [results] = []
    
    var itemsPerPage : Int = 10
    var currentIndexPage : Int = 0
    
    var buttonMore : UIButton = {
        let btn = UIButton(frame: .zero)
        btn.backgroundColor = .clear
        btn.setTitleColor(.black, for: .normal)
        btn.isUserInteractionEnabled = true
        btn.setTitle("Ver más", for: .normal)
        return btn
    }()

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .white
        tableAUsers()
       
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
extension PostLoginViewController: PostLoginView {
    
    func tableAUsers(){
        tableUsers = UITableView(frame: .zero)
        tableUsers.delegate = self
        tableUsers.dataSource = self
        tableUsers.dragInteractionEnabled = false
        tableUsers.showsVerticalScrollIndicator = false
        tableUsers.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableUsers)
        tableUsers.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        tableUsers.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        tableUsers.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tableUsers.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        tableUsers.register(UsersTableViewCell.self, forCellReuseIdentifier: "UsersTableViewCell")
        setupButtonMore()
        arrayFix()
    }
    
    func arrayFix(){
        _ = Float(Float(self.users!.count) / Float(self.itemsPerPage)).rounded(.up)
        self.arrayFilteredChunked = (users?.chunked(into: self.itemsPerPage))!
        self.buttonMore.isHidden = false
        self.currentIndexPage = 0
        self.updatePagination(buttonMore)
        self.tableUsers.layoutIfNeeded()

    }
    
    @objc func updatePagination(_ sender: UIButton){
        if currentIndexPage+1 >= arrayFilteredChunked.count{
            buttonMore.isHidden = true
        }
        self.arrayPage += arrayFilteredChunked[safe: self.currentIndexPage] ?? []
        self.currentIndexPage += 1
        self.tableUsers.reloadData()
    }
    
    func setupButtonMore(){
        buttonMore.frame = CGRect(x: 0, y: 0, width: self.view.frame.width-40, height: 30)
        buttonMore.addTarget(self, action: #selector(self.updatePagination), for: .touchUpInside)
        buttonMore.isHidden = true
        tableUsers.tableFooterView = buttonMore
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPage.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath as IndexPath) as? UsersTableViewCell
        cell?.nameLabel.text = "Nombre: " + (users?[indexPath.row].name?.first ?? "")
        cell?.lastLabel.text = users?[indexPath.row].name?.last
        cell?.setupData(imgUrl: users?[indexPath.row].picture?.thumbnail ?? "")
        cell?.cityLabel.text = "Localización: " + (users?[indexPath.row].location?.city ?? "")
        cell?.countryLabel.text = users?[indexPath.row].location?.country
        cell?.stateLabel.text = users?[indexPath.row].location?.state
        return cell!
        
        
    }
}

public extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
    
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
