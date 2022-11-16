//
//  ScoreBoardTableViewCell.swift
//  ScoreKeeper
//
//  Created by mac on 11/4/22.
//

import UIKit
protocol CellSort {
    func sortingCell(stepper: Int, indexRow: UITableViewCell)
}
class ScoreBoardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreCountLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var delegate: CellSort?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func updateValueCount(_ sender: UIStepper) {
//        guard let stepperReoder = scoreCountLabel.text else { return }
        self.delegate?.sortingCell(stepper: Int(sender.value), indexRow: self)
        scoreCountLabel.text = "\(Int(stepper.value))"
    }
    
 
}
