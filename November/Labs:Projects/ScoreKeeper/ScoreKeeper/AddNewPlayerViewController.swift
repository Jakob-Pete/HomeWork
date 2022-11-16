//
//  AddNewPlayerViewController.swift
//  ScoreKeeper
//
//  Created by mac on 11/3/22.
//

import UIKit
protocol ReceiveDataFromAddNewPlayer {
    func scoreBoardTableViewControllerDelegate(newPlayer: NewPlayer)
}
class AddNewPlayerViewController: UIViewController {
   

    
    @IBOutlet weak var currentScoreLabel: UITextField!
    @IBOutlet weak var playerNameLabel: UITextField!
    @IBOutlet weak var savePlayerButton: UIButton!
    
    var delegate: ReceiveDataFromAddNewPlayer?
    var newplayer: NewPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    init?(coder: NSCoder, newplayer: NewPlayer?) {
//        self.newplayer = newplayer
//        super.init(coder: coder)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func updateView() {
        if let newplayer = newplayer {
            playerNameLabel.text = newplayer.playerName
            currentScoreLabel.text = String(newplayer.currentScore)
        }
    }
    
     @IBAction func saveButtonTapped(_ sender: Any) {
         guard let playerName = playerNameLabel.text, let playerScore = currentScoreLabel.text else { return }
         self.delegate?.scoreBoardTableViewControllerDelegate(newPlayer: NewPlayer(playerName: playerName, currentScore: Int(playerScore) ?? 0))
         
         self.dismiss(animated: false)
         
     }
    
        
//        I need this to change the indexRow depending on the stepper count. if a player is higher than another then i need it to change locationg when comparing 2 players and i need the stepper to reload the table view every time i click on it. 
        
    
   
//         if let _ = newplayer {
//             self.newplayer = NewPlayer(playerName: playerName, currentScore: playerScore)
//         }
         
     
//     // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
