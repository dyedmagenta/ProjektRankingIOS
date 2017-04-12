//
//  RecentGameCell.swift
//  ProjektRanking
//
//  Created by MAC-10 on 29.03.2017.
//  Copyright © 2017 PitPit. All rights reserved.
//

import UIKit

class RecentGameCell: UITableViewCell {

    @IBOutlet weak var labelPlayer: UILabel!
    @IBOutlet weak var labelTournament: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelPlayer.numberOfLines = 1
        labelTournament.numberOfLines = 1
        labelDate.numberOfLines = 1
        
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
