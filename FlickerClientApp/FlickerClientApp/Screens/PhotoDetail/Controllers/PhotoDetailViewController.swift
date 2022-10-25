//
//  PhotoDetailViewController.swift
//  FlickerClientApp
//
//  Created by AHMET HAKAN YILDIRIM on 25.10.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: - UI ELEMENTS
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - PROPERTİES
    
    var photo: Photo?
   
    
    
    // MARK: - LİFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Detail"
        ownerNameLabel.text = "Owner Name"
        descriptionLabel.text = "Description Description Description Description Description"
        ownerNameLabel.text = photo?.ownername
        
        NetworkManager.shared.fetchImage(with: photo?.buddyIconUrl) { data in
            self.ownerImageView.image = UIImage(data: data)
        }
        
        NetworkManager.shared.fetchImage(with: photo?.urlZ) { data in
            self.imageView.image = UIImage(data: data)
        }
        
        title = photo?.title
        descriptionLabel.text = photo?.description?.content
    }
    
    // MARK: - FUNCTİONS
    

    
    // MARK: - ACTİONS
    
    

}
