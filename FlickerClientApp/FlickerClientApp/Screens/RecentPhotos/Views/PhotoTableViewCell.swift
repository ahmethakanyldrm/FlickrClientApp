//
//  PhotoTableViewCell.swift
//  FlickerClientApp
//
//  Created by AHMET HAKAN YILDIRIM on 25.10.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    // MARK: - UI ELEMENTS
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // MARK: - PROPERTİES
    
    // MARK: - LİFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ownerImageView.layer.cornerRadius = 24.0
    }

    // MARK: - FUNCTİONS
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - ACTİONS
    
    

}
