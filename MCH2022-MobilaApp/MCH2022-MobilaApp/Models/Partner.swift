//
//  Partner.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation

struct PartnerCardModel: Hashable {
    var id: Int
    var nameCompany: String
    var INN: String
    var legalAddress: String
    var realAddress: String
    var fieldOfWork: String = ""
    var telephone: String
    var email: String
    var website: String
    var production: String
    var status: String
}

struct PartnersCodable: Codable {
    var partners: [PartnerCardCodable]
}

struct PartnerCardCodable: Codable {
    var _id: String
    var company: PartnerCompanyCodable
    var contacts: PartnerContactsCodable
    var adress: PartnerAddressCodable
    var field: String
    var production: String
    var creationDate: Double
}

struct PartnerCompanyCodable: Codable {
    var INN: String
    var name: String
}

struct PartnerContactsCodable: Codable {
    var telephone: String
    var email: String
    var web: String
}

struct PartnerAddressCodable: Codable {
    var realAddress: String
    var legalAddress: String
}
