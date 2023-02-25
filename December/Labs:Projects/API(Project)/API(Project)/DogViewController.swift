//
//  DogViewController.swift
//  API(Project)
//
//  Created by mac on 12/2/22.
//

import UIKit

class DogViewController: ViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    let controller = DogInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dogImageView.image = UIImage(systemName: "photo.on.rectangle")
        
        Task {
            do {
                let photoInfo = try await controller.fetchPhotoInfo()
                updateUI(with: photoInfo)
            } catch {
                updateUIError(with: error)
            }
        }
    }
    
    @IBAction func newDogImage(_ sender: Any) {
        Task {
            do {
                let image = try await controller.fetchPhotoInfo()
                updateUI(with: image)
            } catch {
                updateUIError(with: error)
            }
        }
    }
    
    func updateUI(with dogInfo: DogInfo) {
        Task {
            do {
                let image = try await controller.fetchImage(from: dogInfo.image)
                dogImageView.image = image
            } catch {
                updateUIError(with: error)
            }
        }
    }
    
    func updateUIError(with error: Error) {
        dogImageView.image = UIImage(systemName: "exclamationmark.octagon")
    }
}
