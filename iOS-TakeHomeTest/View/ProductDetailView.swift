//
//  ProductDetailView.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 09/01/24.
//

import UIKit

class ProductDetailView: UIView {

    var color: UIColor
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 4
        return containerView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Title"
        return label
    }()

    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Value"
        return label
    }()
    
    init(color: UIColor) {
        self.color = color
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProductDetailView {
    
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(titleLabel)
        self.addSubview(containerView)
        self.addSubview(valueLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            valueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            valueLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            valueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }
}
