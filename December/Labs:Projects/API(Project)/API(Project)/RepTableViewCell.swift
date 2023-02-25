//
//  RepTableViewCell.swift
//  API(Project)
//
//  Created by mac on 12/6/22.
//

import UIKit

class RepTableViewCell: UITableViewCell {

    @IBOutlet weak var repNameLable: UILabel!
    @IBOutlet weak var partyLable: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
