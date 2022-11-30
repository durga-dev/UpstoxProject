//
//  HomeViewController.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let tableView = Views.tableView
    private let footerView = Views.footerView

    private let homeViewModel: HomeViewModelProtocol
    var holdingData: UpStockHoldingMapperProtocol? {
        didSet {
            tableView.reloadData()
            footerView.holdingData = holdingData
        }
    }
    
    enum StringConstant: String {
        case stockListCell = "StockListCell"
    }
    
    init(homeViewModel: HomeViewModelProtocol) {
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        homeViewModel.viewDidLoad()
        
        homeViewModel.updateHoldingData = { [weak self] holdingData in
            self?.holdingData = holdingData
            
        }
    }
    
    private func setupUI() {
        view.subviews.forEach({ $0.removeFromSuperview() })
        
        view.addSubview(tableView)
        view.addSubview(footerView)
        
        configureTableView()
        configureFooterView()
    }
    
    private func configureTableView() {
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: .zero
        ).isActive = true
        
        tableView.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: .zero
        ).isActive = true
        
        tableView.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: .zero
        ).isActive = true
        
        tableView.bottomAnchor.constraint(
            equalTo: footerView.topAnchor,
            constant: .zero
        ).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: StringConstant.stockListCell.rawValue
        )
    }
    
    private func configureFooterView() {
        
        footerView.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: .zero
        ).isActive = true
        
        footerView.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: .zero
        ).isActive = true
        
        footerView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: .zero
        ).isActive = true
        
        footerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    public func configureStockListCell(_ listItemView: StockListView) {
        guard let superView = listItemView.superview else {
            return
        }
        
        listItemView.topAnchor.constraint(
            equalTo: superView.topAnchor,
            constant: .zero
        ).isActive = true

        listItemView.leftAnchor.constraint(
            equalTo: superView.leftAnchor,
            constant: .zero
        ).isActive = true

        listItemView.rightAnchor.constraint(
            equalTo: superView.rightAnchor,
            constant: .zero
        ).isActive = true
        
        listItemView.bottomAnchor.constraint(
            equalTo: superView.bottomAnchor,
            constant: .zero
        ).isActive = true
    }
    
    
    // MARK: - VIEWS
    private enum Views {
        static var tableView: UITableView {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.backgroundColor = .gray
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.contentInset = UIEdgeInsets(top: -22, left: 0, bottom: 0, right: 0);
            tableView.showsVerticalScrollIndicator = false
            return tableView
        }
        
        static var footerView: FooterView {
            let footerView = FooterView()
            footerView.translatesAutoresizingMaskIntoConstraints = false
            return footerView
        }
    }
    
}

