//
//  EOLPictureViewController.swift
//  Life-FormSearch
//
//  Created by mac on 1/31/23.
//

import UIKit
import SafariServices
@MainActor

class EOLPictureViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scientificNameLabel: UILabel!
    
    var loadInfoTask: Task<Void, Never>? = nil
    
    let item: EOLFetchItem
    var license: String? = nil
    
    init?(coder: NSCoder, item: EOLFetchItem) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = item.name
        
        loadInfoTask = Task {
            do {
                let itemDetailRequest = SearchRequestDetail(item: item)
                let details = try await ControllerEOL.shared.sendRequest(itemDetailRequest)
                let dataObject = details.details.dataObjects?.first
                
                
                async let image = image(for: dataObject)
                
                update(image: try await image)
                
                scientificNameLabel.text = details.details.scientificName
                
                
                loadInfoTask = nil
            } catch {
                print(error)
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    func update(image: UIImage?) {
        if let image = image {
            imageView.image = image
        }
    }
    
    func image(for dataObject: DataObject?) async throws -> UIImage? {
        guard let mediaURL = dataObject?.eolMediaURL else {
            return nil
        }
        let imageRequest = EOLImageAPIRequest(url: mediaURL)
        let image = try await ControllerEOL.shared.sendRequest(imageRequest)
        
        return image
    }
    
}
