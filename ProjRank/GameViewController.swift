//
//  GameViewController.swift
//  ProjRank
//
//  Created by Tenek on 15/06/2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    
    public var players: [Player] = [Player]()
    public var game: Game?
    var isEdit: Bool = false
    
    @IBOutlet weak var whiteScoreText: UITextField!
    @IBOutlet weak var blackScoreText: UITextField!
    @IBOutlet weak var playerPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var handler: ConnectionHandler = ConnectionHandler()
    
    @IBAction func saveActionButton(_ sender: Any) {
        
        
        let whitePlayerId = players[playerPicker.selectedRow(inComponent: 0)].remoteId
        let blackPlayerId = players[playerPicker.selectedRow(inComponent: 1)].remoteId
        let whiteScoreChange = whiteScoreText.text
        let blackScoreChange = blackScoreText.text
        let date = String(describing: datePicker.date)
        
        if isEdit {
            handler.updateGame(remoteId: (game?.remoteId)!, whitePlayerId: whitePlayerId!, blackPlayerId: blackPlayerId!, whiteScoreChange: whiteScoreChange!, blackScoreChange: blackScoreChange!, date: date)
        }
        else {
            handler.createNewGame(whitePlayerId: whitePlayerId!, blackPlayerId: blackPlayerId!, whiteScoreChange: whiteScoreChange!, blackScoreChange: blackScoreChange!, date: date)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerPicker.delegate = self
        playerPicker.dataSource = self
        
        if let _ = game {
            isEdit = true
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
extension GameViewController : UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return players.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return players[row].name
        } else {
            return players[row].name
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }

}
