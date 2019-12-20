//
//  ViewController.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class ProductListViewController : UIViewController {
    
     // Move to DI container with init
    let viewModel = ProductListViewModel(productListUseCase:DefaultFetchProductsUseCase(productsRepository: DefaultProductsRepository(dataService: DefaultDataService(networkClient: NetworkClient(URLSession(configuration: .default))))), posterImagesRepository : DefaultPosterImagesRepository(dataService: DefaultDataService(networkClient: NetworkClient(URLSession(configuration: .default)))))
    
        
      var items: [PoductListItemViewModel]! {
          didSet { reload() }
      }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeInterface()
        bind(to: viewModel)
        loadProducts()
    }
    
    func bind(to viewModel: ProductListViewModel) {
           viewModel.items.observe(on: self) { [weak self] in self?.items = $0 }
//           viewModel.error.observe(on: self) { [weak self] in //self?.showError($0) }
       }
    
    func initializeInterface()  {
        
         let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
               tableView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
               tableView.rowHeight = UITableView.automaticDimension
               tableView.estimatedRowHeight = 600
    }
    
    func reload(){
         tableView.reloadData()
    }
    
    func loadProducts(){
        viewModel.loadProducts()
    }
}

extension ProductListViewController : UITableViewDataSource {
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        if let items = self.items {
            cell.configCell(with: items[indexPath.row])
        }
        return cell
    }
}

