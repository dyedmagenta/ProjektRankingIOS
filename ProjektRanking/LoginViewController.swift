//
//  LoginViewController.swift
//  ProjektRanking
//
//  Created by MAC-06 on 26.04.2017.
//  Copyright © 2017 PitPit. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func LoginButtonAction(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
        self.present(mainViewController, animated:true, completion:nil)
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
