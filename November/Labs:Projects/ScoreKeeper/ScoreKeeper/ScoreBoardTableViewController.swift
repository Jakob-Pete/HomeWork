//
//  ScoreBoardTableViewController.swift
//  ScoreKeeper
//
//  Created by mac on 11/3/22.
//

import UIKit



class ScoreBoardTableViewController: UITableViewController, ReceiveDataFromAddNewPlayer, CellSort {
    
    
    
    
    var newPlayer: [NewPlayer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ScoreBoardTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForName", for: indexPath) as! ScoreBoardTableViewCell
        
        let player = newPlayer[indexPath.row]
        cell.nameLabel.text = player.playerName
        cell.scoreCountLabel.text = String(player.currentScore)
        cell.stepper.value = Double(player.currentScore)
        
        cell.delegate = self
        return cell
    }

    // MARK: - Table view data source
    
    func sortingCell(stepper: Int, indexRow: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: indexRow) else { return }
        
        
        newPlayer[indexPath.row].currentScore = stepper
        sortingPlayers()
        
    }
    
    func sortingPlayers() {
        guard newPlayer.count > 1 else { return }
        
        func sort(player1: NewPlayer, player2: NewPlayer) -> Bool{
            return player1.currentScore > player2.currentScore
        }
        newPlayer.sort(by: sort(player1:player2:))
        tableView.reloadData()
        
    }
    func scoreBoardTableViewControllerDelegate(newPlayer: NewPlayer) {
        self.newPlayer.append(newPlayer)
        self.newPlayer.sort(by: >)
        tableView.reloadData()
        
    }

    @IBSegueAction func saveButtonTapped(_ coder: NSCoder) -> AddNewPlayerViewController? {
        return AddNewPlayerViewController(coder: coder)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return newPlayer.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueToNewPlayer", let vc = segue.destination as? AddNewPlayerViewController else { return }
        vc.delegate = self
    }
    
    @IBSegueAction func sort(_ coder: NSCoder) -> AddNewPlayerViewController? {
        let newPLayerCon = AddNewPlayerViewController(coder: coder)
        
        newPLayerCon?.delegate = self
        return newPLayerCon
    }
  
    
}
