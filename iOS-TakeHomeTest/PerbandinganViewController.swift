//
//  PerbandinganViewController.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 05/01/24.
//

import UIKit

enum ButtonState {
    case primary
    case secondary
    case plain
}

class PerbandinganViewController: UIViewController {

    private lazy var backButton: UIBarButtonItem = {
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(named: "arrow.back")
        backButton.tintColor = .black
        return backButton
    }()
    
    lazy var perbandinganView: PerbandinganView = {
        let perbandinganView = PerbandinganView()
        perbandinganView.translatesAutoresizingMaskIntoConstraints = false
        return perbandinganView
    }()
    
    let viewModel = PerbandinganViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perbandingan"
        setup()
        perbandinganView.delegate = self

        viewModel.getProduct()
        viewModel.getChart()
    }

}

private extension PerbandinganViewController {
    
    func setup() {
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "Perbandingan"
        self.navigationItem.leftBarButtonItem = backButton
        
        view.addSubview(perbandinganView)
        NSLayoutConstraint.activate([
            perbandinganView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            perbandinganView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            perbandinganView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            perbandinganView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
}

extension PerbandinganViewController: PerbandinganViewDelegate {
    func updateContent(with viewModel: PerbandinganViewModel.ProductViewModel) {

    }
}
