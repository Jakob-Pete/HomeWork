//
//  UsersTableViewCell.swift
//  Code Challenge 2# FindUserUpdated
//
//  Created by mac on 2/27/23.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!
    //    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var natLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUser(user: User) {
        nameLabel.text = user.name?.first
        genderLabel.text = user.gender
        locationLabel.text = user.location?.city
        emailLabel.text = user.email
        registeredLabel.text = user.registered?.date
        dobLabel.text = user.dob?.date
        numberLabel.text = user.phone
        idLabel.text = user.id?.name
        natLabel.text = user.nationality
        
        if let url = URL(string: user.picture?.large ?? "") {
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self?.userImage.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
