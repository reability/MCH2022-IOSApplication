//
//  PartnerViewCell.swift
//  MCH2022-MobilaApp
//
//  Created by Maxim Savchenko on 12.06.2022.
//

import UIKit

final class PartnerViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var namePartnerLabel: UILabel!
    @IBOutlet weak var descPartnerLabel: UILabel!
    @IBOutlet weak var bottomTextLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    static var reuseIdentifier: String = "PartnerViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 24
    }
    
    func setup(_ model: PartnerCardModel) {
        
        namePartnerLabel.text = model.nameCompany
        descPartnerLabel.text = model.production
        
        bottomTextLabel.text = model.status
        
        if model.status == "Принят" {
            bottomTextLabel.textColor = .green
        } else {
            bottomTextLabel.textColor = .lightGray
        }

    }

}
