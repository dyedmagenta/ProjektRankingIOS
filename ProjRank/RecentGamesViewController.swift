//
//  RecentGamesViewController.swift
//  ProjRank
//
//  Created by MAC-10 on 31.05.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit
import Alamofire

class RecentGamesViewController: UIViewController {

    var handler: ConnectionHandler = ConnectionHandler()
    
    @IBAction func refreshData(_ sender: Any) {
            handler.refreshAllData()                
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
