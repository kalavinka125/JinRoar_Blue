//
//  RoleTableViewCell.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/11/30.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit

class RoleTableViewCell: UITableViewCell {

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var warewolfKillVoteLabel: UILabel!
    @IBOutlet weak var roleCellImageView: UIImageView!
    @IBOutlet weak var abilityTargetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
