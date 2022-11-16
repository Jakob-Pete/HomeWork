//
//  ToDoCell.swift
//  ToDoList(Christmas Edition)
//
//  Created by mac on 11/15/22.
//

import UIKit
protocol ToDoCellDelegate: AnyObject {
    func checkmarkTapped(sender: ToDoCell)
    
}
class ToDoCell: UITableViewCell {
    
    weak var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
}
