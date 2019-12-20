//
//  ViewController.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class ProductListViewController : UIViewController {
    
     // Move to DI with init
    let modelView = ProductListViewModel(productListUseCase:DefaultFetchProductsUseCase(productsRepository: DefaultProductsRepository(dataService: DefaultDataService())))
    
    

    var items : [Product]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.modelView.loadProducts { [weak self] (result) in
              guard let welf = self else { return }
                      switch result {
                      case .success(let products):
                        welf.items = products
                        welf.tableView.reloadData()
                      case .failure (let error):
                        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                                    
                                }
                                alertController.addAction(OKAction)
                                welf.present(alertController, animated: true, completion:nil)
                      }
        }
        
    }
}

extension ProductListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = self.items{
            return items.count
        }
        else{
            return 0
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        if let items = self.items, let product = items.first{
            cell.configCell(product: product)
        }
        return cell
    }
    
    
    
}

