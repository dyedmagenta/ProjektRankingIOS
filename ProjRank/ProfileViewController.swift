//
//  ProfileViewController.swift
//  ProjRank
//
//  Created by MAC-10 on 31.05.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    
    @IBAction func addGameAction(_ sender: Any) {
        
        let vc = (
            storyboard?.instantiateViewController(
                withIdentifier: "GameViewController")
            )!
        vc.modalTransitionStyle = .crossDissolve
        let vv = vc as! GameViewController
        vv.players = pickerData
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func refreshButton(_ sender: Any) {
        handler.refreshAllData()
        loadData()
        self.tableView.reloadData()
    }
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func editAction(_ sender: Any) {
        let vc = (
            storyboard?.instantiateViewController(
                withIdentifier: "GameViewController")
            )!
        vc.modalTransitionStyle = .crossDissolve
        let vv = vc as! GameViewController
        vv.players = pickerData
        vv.game = games[selectedGameIndex]
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        if selectedGameIndex < 0 {
            return
        }
        handler.deleteGame(remoteId: games[selectedGameIndex].remoteId!)
        self.tableView.reloadData()
    }
    var pickerData: [Player] = [Player]()
    var games: [Game] = [Game]()
    var currentPlayer: Player = Player()
    var context: NSManagedObjectContext = NSManagedObjectContext()
    var handler: ConnectionHandler = ConnectionHandler()
    var selectedGameIndex: Int = 0
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playingSinceLabel: UILabel!
    
    func loadData(){
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
            }
            let managedContext =
                appDelegate.persistentContainer.viewContext
            context = managedContext
            let playersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
            do {
                pickerData = try managedContext.fetch(playersFetch) as! [Player]
                
            }
            catch {
                fatalError("Failed to fetch games: \(error)")
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
       
        
        rankLabel.text = pickerData[0].rank
        nameLabel.text = pickerData[0].name
        scoreLabel.text = pickerData[0].score
        playingSinceLabel.text = pickerData[0].playingSince
        let gamesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        gamesFetch.predicate = NSPredicate(format: "whitePlayerId == %@ || blackPlayerId == %@", pickerData[0].remoteId!, pickerData[0].remoteId!)
        do {
            let fetchedGame = try context.fetch(gamesFetch) as! [Game]
            games = fetchedGame
        }
        catch {
            fatalError("Failed to fetch games: \(error)")
        }

        
        tableView.reloadData()
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
        return games.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! ProfileCell
            
            cell.player1Label.text = "White Player"
            cell.player1ScoreLabel.text = ""
            cell.player2Label.text = "Black Player"
            cell.player2ScoreLabel.text = ""
            cell.dateLabel.text = "Date"
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentCell", for: indexPath) as! ProfileCell
            
            let game = games[indexPath.row - 1]
            
            cell.player1Label.text = game.whitePlayer!.name
            cell.player1ScoreLabel.text = " (" + game.whiteScoreChange! + ")"
            cell.player2Label.text = game.blackPlayer!.name
            cell.player2ScoreLabel.text = " (" + game.blackScoreChange! + ")"
            cell.dateLabel.text = game.date
            
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
        
        return pickerData[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        rankLabel.text = pickerData[row].rank
        nameLabel.text = pickerData[row].name
        scoreLabel.text = pickerData[row].score
        playingSinceLabel.text = pickerData[row].playingSince
        currentPlayer = pickerData[row]
        
        
        
        let gamesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        gamesFetch.predicate = NSPredicate(format: "whitePlayerId == %@ || blackPlayerId == %@", pickerData[row].remoteId!, pickerData[row].remoteId!)
        do {
            let fetchedGame = try context.fetch(gamesFetch) as! [Game]
            games = fetchedGame
        }
        catch {
            fatalError("Failed to fetch games: \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedGameIndex = indexPath.row - 1
        
    }
    
}

