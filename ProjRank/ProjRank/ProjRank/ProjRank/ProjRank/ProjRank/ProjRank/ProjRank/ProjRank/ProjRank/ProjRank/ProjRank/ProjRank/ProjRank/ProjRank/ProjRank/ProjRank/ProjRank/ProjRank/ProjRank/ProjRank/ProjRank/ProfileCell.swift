//
//  ProfileCell.swift
//  ProjRank
//
//  Created by MAC-10 on 31.05.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
