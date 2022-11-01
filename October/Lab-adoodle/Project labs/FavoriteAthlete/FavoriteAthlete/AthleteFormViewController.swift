//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by mac on 10/19/22.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete: Athlete?
    var delegate: addAthleteProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let age = Int(ageString),
              let league = leagueTextField.text,
              let team = teamTextField.text else {return}
        
        if let _ = athlete {
            self.athlete = Athlete(name: name, age: age, league: league, team: team)
            delegate?.editAthlete(athlete: self.athlete!)
        } else {
            athlete = Athlete(name: name, age: age, league: league, team: team)
            delegate?.addAthlete(athlete: athlete!)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    
    
    func updateView() {
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = String(athlete.age)
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
            
        }
        
    }
    /*
     @IBOutlet weak var teamTextField: UITextField!
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
