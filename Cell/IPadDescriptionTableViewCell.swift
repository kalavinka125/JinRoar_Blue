//
//  IPadDescriptionTableViewCell.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/12/07.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit

class IPadDescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var descriptionImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
