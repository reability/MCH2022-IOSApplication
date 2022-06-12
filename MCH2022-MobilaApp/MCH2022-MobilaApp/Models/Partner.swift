//
//  Partner.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation


struct PartnerCardModel: Hashable {
    var id: Int
}


struct PartnerCardCodable: Codable {
    var inn: String
    var name: String
    var address: String
    
    var field: String
    var production: String
    
}
