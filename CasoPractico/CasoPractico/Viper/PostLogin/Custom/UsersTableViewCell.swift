//
//  UsersTableViewCell.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//

import Foundation
import UIKit

class UsersTableViewCell: UITableViewCell {
    
    var nameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lastLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageViewPerson: UIImageView = {
        let uiView = UIImageView(frame: .zero)
        uiView.contentMode = .scaleAspectFit
        uiView.clipsToBounds = true
        uiView.isUserInteractionEnabled = true
        uiView.backgroundColor = .black
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    var cityLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var countryLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stateLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        deinit {
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
        }
        
        //MARK: - Init functions
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupConstraints(){
            
            self.contentView.addSubview(imageViewPerson)
            imageViewPerson.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
            imageViewPerson.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            imageViewPerson.heightAnchor.constraint(equalToConstant: 120).isActive = true
            imageViewPerson.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            self.contentView.addSubview(nameLabel)
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            nameLabel.leftAnchor.constraint(equalTo: imageViewPerson.rightAnchor, constant: 20).isActive = true
            
            self.contentView.addSubview(lastLabel)
            lastLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            lastLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 5).isActive = true
            
            self.contentView.addSubview(cityLabel)
            cityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
            cityLabel.leftAnchor.constraint(equalTo: imageViewPerson.rightAnchor, constant: 20).isActive = true
            
            self.contentView.addSubview(countryLabel)
            countryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
            countryLabel.leftAnchor.constraint(equalTo: cityLabel.rightAnchor, constant: 5).isActive = true
            
            self.contentView.addSubview(stateLabel)
            stateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
            stateLabel.leftAnchor.constraint(equalTo: countryLabel.rightAnchor, constant: 5).isActive = true
            
            
            
        }
        
    
    func setupData(imgUrl : String){
        if let url = URL(string: imgUrl) {
            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
                    if let data = data {
                         DispatchQueue.main.async{
                             self.imageViewPerson.image = UIImage(data: data)
                             self.layoutIfNeeded()
                         }
                    }
                }.resume()
        }
    }
    
}
