//
//  RankingHeadersCell.swift
//  ProjektRanking
//
//  Created by MAC-06 on 12.04.2017.
//  Copyright © 2017 PitPit. All rights reserved.
//

import UIKit

class RankingHeadersCell: UITableViewCell {

    
    @IBOutlet weak var playersLabel: UILabel!
    @IBOutlet weak var tournamentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        playersLabel.numberOfLines = 1
        tournamentLabel.numberOfLines = 1
        dateLabel.numberOfLines = 1
        scoreLabel.numberOfLines = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
