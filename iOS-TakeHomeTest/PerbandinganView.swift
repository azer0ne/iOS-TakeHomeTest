//
//  PerbandinganView.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 05/01/24.
//

import UIKit

protocol PerbandinganViewDelegate: AnyObject {
    func updateContent(with viewModel: PerbandinganViewModel.ProductViewModel)
}

class PerbandinganView: UIView, PerbandinganViewDelegate {

    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var chartView: UIView = {
        let view = ChartView()
        return view
    }()
    
    lazy var productHeaderView: UIView = {
        let view = ProductHeaderView()
        return view
    }()

    lazy var productDetailView: UIView = {
        let view = ProductDetailView()
        return view
    }()
    
    lazy var productButtonView: UIView = {
        let view = ProductButtonView()
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateContent(with viewModel: PerbandinganViewModel.ProductViewModel) {
        
    }

}

private extension PerbandinganView {
    
    // MARK: - UI Setup
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(chartView)
        containerView.addSubview(productHeaderView)
        containerView.addSubview(productDetailView)
        containerView.addSubview(productButtonView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        chartView.translatesAutoresizingMaskIntoConstraints = false
        productHeaderView.translatesAutoresizingMaskIntoConstraints = false
        productDetailView.translatesAutoresizingMaskIntoConstraints = false
        productButtonView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            chartView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            chartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            chartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),

            productHeaderView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 12),
            productHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            productHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            productDetailView.topAnchor.constraint(equalTo: productHeaderView.bottomAnchor, constant: 12),
            productDetailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            productDetailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),

            productButtonView.topAnchor.constraint(equalTo: productDetailView.bottomAnchor, constant: 12),
            productButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            productButtonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)
            
        ])
    }
}
