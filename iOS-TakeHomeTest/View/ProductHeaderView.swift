//
//  ProductHeaderView.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 09/01/24.
//

import UIKit

class ProductHeaderView: UIView {

    var color: UIColor
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = color
        containerView.layer.cornerRadius = 4
        return containerView
    }()

    lazy var avatarImage: UIImageView = {
       let avatarImage = UIImageView()
        avatarImage.contentMode = .scaleAspectFill
       return avatarImage
    }()

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.text = "Title"
        return titleLabel
    }()
    
    init(color: UIColor) {
        self.color = color
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ProductHeaderView {
    
    private func setup() {
        self.addSubview(containerView)
        self.addSubview(avatarImage)
        self.addSubview(titleLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
            avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            
            titleLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)
        
        ])
    }
}
