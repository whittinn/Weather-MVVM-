//
//  CustomTableViewCell.swift
//  Weather
//
//  Created by Nathaniel Whittington on 5/5/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
 
    @IBOutlet weak var tempfText: UILabel!
    @IBOutlet weak var tempCtext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
