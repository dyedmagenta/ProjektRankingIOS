//
//  RecentGameCell.swift
//  ProjektRanking
//
//  Created by MAC-10 on 29.03.2017.
//  Copyright © 2017 PitPit. All rights reserved.
//

import UIKit

class RecentGameCell: UITableViewCell {

    @IBOutlet weak var labelPlayer1: UILabel!
    @IBOutlet weak var labelPlayerChange1: UILabel!
    @IBOutlet weak var labelPlayer2: UILabel!
    @IBOutlet weak var labelPlayerChange2: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
