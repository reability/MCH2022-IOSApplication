//
//  PartnerCollectionViewCell.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation
import UIKit

final class PartnerCollectionViewCell: UICollectionViewCell {
    static var reuseIdentifier: String = "PartnerCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        return $0
    }(UIImageView())
    
    private lazy var titleView: UILabel = {
        return $0
    }(UILabel())
    
    private lazy var descriptionView: UILabel = {
        return $0
    }(UILabel())
    
    func setup() {
        super.prepareForReuse()
        layout()
        titleView.text = "Text"
        descriptionView.text = "Subtext"
        self.contentView.backgroundColor = .red
    }
    
    private func layout() {
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(titleView)
        self.contentView.addSubview(descriptionView)
        
        imageView.snp.makeConstraints { maker in
            maker.leading.top.equalToSuperview().offset(12.0)
            maker.width.height.equalTo(44.0)
        }
        
        titleView.snp.makeConstraints { maker in
            maker.top.equalTo(imageView.snp.bottom).offset(4.0)
            maker.trailing.equalToSuperview()
            maker.leading.equalToSuperview().offset(12.0)
        }
        
        descriptionView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12.0)
            maker.trailing.equalToSuperview()
            maker.top.equalTo(titleView.snp.bottom).offset(2.0)
        }
    }
    
}
