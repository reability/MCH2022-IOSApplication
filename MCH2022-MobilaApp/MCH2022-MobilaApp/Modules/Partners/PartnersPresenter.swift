//
//  PartnersPresenter.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation
import UIKit

protocol Presenter {
    func viewDidLoad()
}


final class PartnersPresenter: Presenter {
    
    weak var view: PartnersView?
    var service = MHCServiceImp()
    
    func viewDidLoad() {
        
        service.getPartners { [weak self] model in
            
            let resultModel = model.enumerated().map({ (index, object) in PartnerCardModel(id: index, nameCompany: object.company.name, INN: object.company.INN, legalAddress: object.adress.legalAddress, realAddress: object.adress.realAddress, telephone: object.contacts.telephone, email: object.contacts.email, website: object.contacts.web, production: object.production, status: "Ожидается на рассмотрении с 13 июня 2022") })
            
            DispatchQueue.main.async {
                self?.view?.reload(resultModel, animated: true)
            }
            
        }
        
    }
}
