//
//  ViewController.swift
//  NASAPictureOfTheDay!
//
//  Created by mac on 11/30/22.
//

import UIKit

@MainActor
class ViewController: UIViewController {

    @IBOutlet weak var diescriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nasaImageView: UIImageView!
    
    let controller = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = ""
        nasaImageView.image = UIImage(systemName: "photo.on.rectangle")
        diescriptionLabel.text = ""
        titleLabel.text = ""
    
        Task {
            do {
                let photoInfo = try await
                controller.fetchPhotoInfo()
                updateUI(with: photoInfo)
            } catch {
                updateUI(with: error)
            }
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        Task {
            do {
                let image = try await controller.fetchImage(from:
                   photoInfo.url)
                title = photoInfo.title
                nasaImageView.image = image
                diescriptionLabel.text = photoInfo.description
                titleLabel.text = photoInfo.copyright
            } catch {
                updateUI(with: error)
            }
        }
    }
    
    func updateUI(with error: Error) {
        title = "Error Fetching Photo"
        nasaImageView.image = UIImage(systemName: "exclamationmark.octagon")
        diescriptionLabel.text = error.localizedDescription
        titleLabel.text = ""
    }


    
    
}

