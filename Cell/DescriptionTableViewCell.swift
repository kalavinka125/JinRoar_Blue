//
//  DescriptionTableViewCell.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/12/02.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.descriptionTextView.isScrollEnabled = false
        let font = UIFont(name: "PixelMplus10-Regular", size: 20)
        self.descriptionTextView.font = font
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
