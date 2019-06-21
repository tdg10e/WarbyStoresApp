//
//  AboutStoreTableViewCell.swift
//  WarbyAssessment
//
//  Created by Tremaine Grant on 6/21/19.
//

import UIKit

class AboutStoreTableViewCell: UITableViewCell {

    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var noDescriptionImg: UIImageView!
    @IBOutlet weak var aboutStore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        aboutView.addShadow()
        aboutView.roundCorners()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
