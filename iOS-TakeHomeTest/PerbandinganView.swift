//
//  PerbandinganView.swift
//  iOS-TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 05/01/24.
//

import UIKit

class PerbandinganView: UIView {

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
    
    lazy var productHeaderStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillEqually
       return stack
    }()

    lazy var productDetailVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var productDetailStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillEqually
       return stack

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

    func renderUI(productViewModel: [PerbandinganViewModel.ProductViewModel]) {
        for (index, viewModel) in productViewModel.enumerated() {
            let color: UIColor = PerbandinganView.getProductColor(index: index)
            
            let productHeaderView = ProductHeaderView(color: color)
            productHeaderView.titleLabel.text = viewModel.productTitle
            
            productHeaderStackView.addArrangedSubview(productHeaderView)
            
            for detail in viewModel.detail {
                let productDetailView = ProductDetailView(color: color)
                
                if (index == 0) {
                    productDetailView.titleLabel.text = detail.title
                }
                
                productDetailView.valueLabel.text = detail.value
                productDetailVerticalStack.addArrangedSubview(productDetailView)
            }
            
            productDetailVerticalStack.addArrangedSubview(productButtonView)
        }
    }
}

// MARK: - UI Setup
private extension PerbandinganView {
    
    private func setupUI() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(chartView)
        containerView.addSubview(productHeaderStackView)
        containerView.addSubview(productDetailStackView)
        containerView.addSubview(productButtonView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        chartView.translatesAutoresizingMaskIntoConstraints = false
        productHeaderStackView.translatesAutoresizingMaskIntoConstraints = false
        productDetailStackView.translatesAutoresizingMaskIntoConstraints = false
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

            productHeaderStackView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 12),
            productHeaderStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            productHeaderStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            productDetailStackView.topAnchor.constraint(equalTo: productHeaderStackView.bottomAnchor, constant: 12),
            productDetailStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            productDetailStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),

            productButtonView.topAnchor.constraint(equalTo: productDetailStackView.bottomAnchor, constant: 12),
            productButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            productButtonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)
            
        ])

    }
}

extension PerbandinganView {
    enum ProductColor {
        case green, purple, blue
        
        var uiColor: UIColor {
            switch self {
            case .green: return UIColor(red: 0.888, green: 0.92, blue: 0.865, alpha: 1)
            case .purple: return UIColor(red: 0.88, green: 0.857, blue: 0.922, alpha: 1)
            case .blue: return UIColor(red: 0.877, green: 0.91, blue: 0.933, alpha: 1)
            }
        }
    }
    
    static func getProductColor(index: Int) -> UIColor {
        let colors: [ProductColor] = [.green, .purple, .blue]
        
        let colorIndex = index % colors.count
        return colors[colorIndex].uiColor
    }
}

