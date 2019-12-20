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
    
    
    @IBOutlet weak var productImage : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var descLbl : UILabel!
    @IBOutlet weak var PriceLbl : UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(product: Product ){
        self.nameLbl.text = product.name
        self.descLbl.text = product.desc
        self.PriceLbl.text = product.price
    }
    
    @IBAction func addWhishListOnClick(sender: UIButton) {
       
     }
    
    @IBAction func removeWhishListOnClick(sender: UIButton) {
      
    }

}
    
    
    
