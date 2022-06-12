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
    
    func viewDidLoad() {
        view?.reload([PartnerCardModel(id: 0), PartnerCardModel(id: 1), PartnerCardModel(id: 2)], animated: true)
    }
}
