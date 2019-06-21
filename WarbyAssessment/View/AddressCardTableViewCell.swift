//
//  AddressCardTableViewCell.swift
//  WarbyAssessment
//
//  Created by Tremaine Grant on 6/21/19.
//

import UIKit

class AddressCardTableViewCell: UITableViewCell {

    @IBOutlet weak var storeAddressView: UIView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var cityStateZip: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storeAddressView.addShadow()
        storeAddressView.roundCorners()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
