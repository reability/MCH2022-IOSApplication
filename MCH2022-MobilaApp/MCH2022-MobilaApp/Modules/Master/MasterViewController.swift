//
//  MasterViewController.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation
import UIKit


final class MasterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        openPartnersView()
    }
    
    private func openPartnersView() {
        let presenter = PartnersPresenter()
        let viewController = PartnersViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        
        addChild(viewController)
        self.view.addSubview(viewController.view)
        viewController.view.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
}
