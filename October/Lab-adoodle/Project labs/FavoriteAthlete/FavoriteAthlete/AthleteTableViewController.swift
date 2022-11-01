import UIKit

protocol addAthleteProtocol {
    func addAthlete(athlete:Athlete)
    func editAthlete(athlete: Athlete)
}

class AthleteTableViewController: UITableViewController,addAthleteProtocol {
    
    
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBSegueAction func addAthlete(_ coder: NSCoder) -> AthleteFormViewController? {
        let vc  = AthleteFormViewController(coder: coder, athlete: nil)
        vc?.delegate = self
        return vc
    }
    
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
        let athleteToEdit: Athlete?
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            athleteToEdit = athletes[indexPath.row]
        } else {
            athleteToEdit = nil
        }
        
        let vc = AthleteFormViewController(coder: coder, athlete: athleteToEdit)
        vc?.delegate = self
        return vc
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    func addAthlete(athlete: Athlete) {
        athletes.append(athlete)
        tableView.insertRows(at: [IndexPath(row: athletes.count - 1, section: 0)], with: .fade)
    }
        func editAthlete(athlete: Athlete) {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                athletes[selectedIndexPath.row] = athlete
                tableView.reloadData()
                
            }
            
            
        }
    
    
}
