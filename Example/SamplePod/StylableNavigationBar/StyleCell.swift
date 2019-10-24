//
//  StyleCell.swift
//  StylableNavigationBar_Example
//
//  Created by Pavlo Chernovolenko on 9/30/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class StyleCell: UITableViewCell {

    @IBOutlet weak var colorExampleView: UIView!
    @IBOutlet weak var textStyleExampleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
