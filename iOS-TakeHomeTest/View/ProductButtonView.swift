//
//  ProductButtonView.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 09/01/24.
//

import UIKit

class ProductButtonView: UIView {

    lazy var detailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Detail", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.accent.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 4
        return button
    }()

    lazy var beliButton: UIButton = {
        let button = UIButton()
        button.setTitle("Beli", for: .normal)
        button.backgroundColor = .accent
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.layer.cornerRadius = 4
        button.titleLabel?.textColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProductButtonView {
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(detailButton)
        self.addSubview(beliButton)
        
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        beliButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            detailButton.heightAnchor.constraint(equalToConstant: 35),
            detailButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            beliButton.topAnchor.constraint(equalTo: detailButton.bottomAnchor, constant: 12),
            beliButton.heightAnchor.constraint(equalToConstant: 35),
            beliButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            beliButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        ])
    }
}
