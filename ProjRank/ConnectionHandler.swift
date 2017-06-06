//
//  ConnectionHandler.swift
//  ProjRank
//
//  Created by MAC-10 on 06.06.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ConnectionHandler: NSObject {
    
    var connectionString: String = "http://52.58.170.113:5000/api/"
    var tables = ["player", "news", "tournament", "game"]
    
    func refreshAllData ()  {
        
        for table in tables {
            Alamofire.request(connectionString + table).responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    print(swiftyJsonVar)
                }
            }
            
        }
        

    }
    
    
}
