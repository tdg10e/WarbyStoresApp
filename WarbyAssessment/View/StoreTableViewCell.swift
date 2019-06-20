//
//  StoreTableViewCell.swift
//  WarbyAssessment
//
//  Created by Mac User on 6/20/19.
//

import UIKit

class StoreTableViewCell: UITableViewCell {

    @IBOutlet weak var storeImg: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var cityStateZip: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}
