//
//  CoffeeCell.swift
//  FloatButton
//
//  Created by Wai Thura Tun on 7/25/24.
//

import UIKit

class CoffeeCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var data: CoffeeVO? {
        didSet {
            if let data = data {
                self.lblTitle.text = data.name
                self.lblPrice.text = data.price.toString()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

