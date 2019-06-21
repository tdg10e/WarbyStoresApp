//
//  StoreTableViewCell.swift
//  WarbyAssessment
//
//  Created by Mac User on 6/20/19.
//

import UIKit

protocol StoreListingDelegate: class {
    func select(store: WarbyStore)
}

class StoreTableViewCell: UITableViewCell {
    
    var store = WarbyStore()
    weak var delegate: StoreListingDelegate?

    @IBOutlet weak var storeImg: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var cityStateZip: UILabel!
    
    @IBOutlet weak var storeCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        storeCard.roundCorners()
        storeCard.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        //self.delegate?.select(store: self.store)
        
    }
    
}
