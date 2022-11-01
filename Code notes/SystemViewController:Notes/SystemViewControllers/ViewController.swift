//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by mac on 10/25/22.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let activityController = UIActivityViewController(activityItems: [image, "Dis a squrirl"], applicationActivities: nil)
        
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController, animated: true)
    }
    
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://www.apple.com") else { return }
        
        let safriController = SFSafariViewController(url: url)
        present(safriController, animated: true)
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        
        
        let canclAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(canclAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let camerActioin = UIAlertAction(title: "Camera", style: .default) { _ in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true)
                
            }
            alertController.addAction(camerActioin)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLiberaryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(photoLiberaryAction)
            
        }
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true)
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["jakobpete2@gmail.com"])
        mailComposer.setSubject("Check iiiiit oooout")
        mailComposer.setMessageBody("Woot Woot", isHTML: false)
        
        if let image = imageView.image, let jpegData = image.jpegData(compressionQuality: 0.9) {
            mailComposer.addAttachmentData(jpegData, mimeType: "image/jpeg", fileName: "Photo.jpg")
            
        }
        
        present(mailComposer, animated: true)
        
    }
    
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        imageView.image = selectedImage
        
        dismiss(animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        dismiss(animated: true)
    }
}
