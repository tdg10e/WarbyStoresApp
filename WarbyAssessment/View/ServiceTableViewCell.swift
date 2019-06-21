//
//  OpticalServiceTableViewCell.swift
//  WarbyAssessment
//
//  Created by Tremaine Grant on 6/21/19.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceView: UIView!
    @IBOutlet weak var service: UILabel!
    @IBOutlet weak var serviceIcon: UIImageView!
    @IBOutlet weak var isAvailableIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        serviceView.addShadow()
        serviceView.roundCorners()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
