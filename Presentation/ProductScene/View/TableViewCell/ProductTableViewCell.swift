//
//  ProductTableViewCell.swift
//  ProductList
//
//  Created by Madhu on 2019/12/20.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

//protocol ProductTableViewCellDelegate {
//    func addWhishListOnClick(product : Product)
//    func removeWhishListOnClick(product : Product)
//}

class ProductTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var descLbl: UILabel!
    
    
    @IBOutlet weak var priceLbl: UILabel!
    
    private var viewModel: PoductListItemViewModel! { didSet { unbind(from: oldValue) } }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func addWhishListOnClick(sender: UIButton) {
       
     }
    
    @IBAction func removeWhishListOnClick(sender: UIButton) {
      
    }
    
    func configCell(with viewModel: PoductListItemViewModel ){
        if let name = viewModel.name{
            nameLbl.text = name
        }
        if let desc = viewModel.desc{
            descLbl.text = desc
        }
        if let price = viewModel.price{
            priceLbl.text = price
        }
        
        viewModel.updatePosterImage()
        
        bind(to: viewModel)
    }
    
    func bind(to viewModel: PoductListItemViewModel) {
        viewModel.posterImage.observe(on: self) { [weak self] in
            guard let imgData = $0 else {return}
            self?.productImage?.image =  UIImage(data: imgData)
            self?.layoutIfNeeded()
        }
           
        
    }
    
    private func unbind(from item: PoductListItemViewModel?) {
        item?.posterImage.remove(observer: self)
    }

}
    
    
    
