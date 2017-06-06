//
//  ProfileViewController.swift
//  ProjRank
//
//  Created by MAC-10 on 31.05.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    var pickerData: [String] = [String]	()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        pickerData = ["Jan","Dzban", "Man"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentHeaderCell", for: indexPath) as! RecentCell
           
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentCell", for: indexPath) as! RecentCell
            
            return cell
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
}

