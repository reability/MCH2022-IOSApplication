//
//  MapViewController.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation
import UIKit
import SnapKit

final class SuperViewController: UIViewController {
    
    var leadingOffset: CGFloat = 24.0
    var littleSpacing: CGFloat = 8.0
    var tinySpacing: CGFloat = 4.0
    var bigSpacing: CGFloat = 10.0
    var parentVC: PartnersViewController?
    
    let grayColor = UIColor(red: 0.235, green: 0.243, blue: 0.255, alpha: 1)
    
    private lazy var orderNumberView: UILabel = {
        $0.text = "№323-3444"
        $0.textColor = grayColor
        
        return $0
    }(UILabel())
    
    private lazy var mainTitle: UILabel = {
        $0.text = "Запрос на добавление продукции"
        $0.font = UIFont.boldSystemFont(ofSize: 32.0)
        
        return $0
    }(UILabel())
    
    private lazy var generalTitle: UILabel = {
        $0.text = "Общая информация"
        $0.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        return $0
    }(UILabel())
    
    private lazy var contactTitle: UILabel = {
        $0.text = "Контактная информация"
        $0.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        return $0
    }(UILabel())
    
    private lazy var formNameOfCompanyTitleView: UILabel = {
        $0.text = "Название компании"
        $0.font = UIFont.systemFont(ofSize: 14.0)
        
        return $0
    }(UILabel())
    
    private lazy var formNameOfCompanyValueView: UILabel = {
        $0.text = "-"
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.textColor = grayColor
        
        return $0
    }(UILabel())
    
    private lazy var formINNTitleView: UILabel = {
        $0.text = "ИНН"
        $0.font = UIFont.systemFont(ofSize: 14.0)
        
        return $0
    }(UILabel())
    
    private lazy var formINNValueView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "-"
        $0.textColor = grayColor
        
        return $0
    }(UILabel())
    
    private lazy var formLegalAddressTitleView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "Юридический адрес"
        
        return $0
    }(UILabel())
    
    private lazy var formLegalAddressValueView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "-"
        $0.textColor = grayColor
        
        return $0
    }(UILabel())
    
    private lazy var formRealAddressTitleView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "Фактический адрес"
        
        return $0
    }(UILabel())
    
    private lazy var formRealAddressValueView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.textColor = grayColor
        $0.text = "-"
        
        return $0
    }(UILabel())
    
    private lazy var formTelephoneTitleView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "Телефон"
        
        return $0
    }(UILabel())
    
    private lazy var formTelephoneValueView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.textColor = grayColor
        $0.text = "-"
        
        return $0
    }(UILabel())
    
    private lazy var formEmailTitleView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "Электронная почта"
        
        return $0
    }(UILabel())
    
    private lazy var formEmailValueView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.textColor = grayColor
        $0.text = "-"
        
        return $0
    }(UILabel())
    
    private lazy var formWEBTitleView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "Сайт"
        
        return $0
    }(UILabel())
    
    private lazy var formWEBlValueView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.textColor = grayColor
        $0.text = "-"
        
        return $0
    }(UILabel())
    
    private lazy var aboutUsView: UILabel = {
        $0.font = UIFont.boldSystemFont(ofSize: 18.0)
        $0.text = "О продукции"
        
        return $0
    }(UILabel())
    
    private lazy var formFieldTitleView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "Основной вид деятельности"
        
        return $0
    }(UILabel())
    
    private lazy var formFieldValueView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "-"
        $0.textColor = grayColor
        
        return $0
    }(UILabel())
    
    private lazy var formProductionTitleView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "Добавляемая продукция"
        
        return $0
    }(UILabel())
    
    private lazy var formResoursesTitleView: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "Используем сырье"
        
        return $0
    }(UILabel())
    
    private lazy var bubleStack: UIStackView = {
        $0.distribution = .equalSpacing
        $0.spacing = 8.0
        return $0
    }(UIStackView(arrangedSubviews: [buble1]))
    
    private lazy var buble1: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 11.0)
        $0.text = "Мясное изделие"
        $0.textColor = grayColor
        $0.layer.cornerRadius = 8.0
        $0.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.969, alpha: 1)
        $0.clipsToBounds = true
        return $0
    }(UILabel())
    
    private lazy var buble2: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 11.0)
        $0.text = "Мясная продуция "
        $0.layer.cornerRadius = 8.0
        $0.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.969, alpha: 1)
        $0.textColor = grayColor
        $0.clipsToBounds = true
        return $0
    }(UILabel())
    
    private lazy var buble3: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 11.0)
        $0.text = "Вырезка "
        $0.layer.cornerRadius = 8.0
        $0.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.969, alpha: 1)
        $0.textColor = grayColor
        $0.clipsToBounds = true
        return $0
    }(UILabel())
    
    private lazy var buble4: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 11.0)
        $0.text = "Кости"
        $0.layer.cornerRadius = 8.0
        $0.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.969, alpha: 1)
        $0.textColor = grayColor
        $0.clipsToBounds = true
        return $0
    }(UILabel())
    
    private lazy var buble5: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 11.0)
        $0.text = "Вырезка"
        $0.layer.cornerRadius = 8.0
        $0.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.969, alpha: 1)
        $0.textColor = grayColor
        $0.clipsToBounds = true
        return $0
    }(UILabel())
    
    private lazy var resStack: UIStackView = {
        $0.distribution = .equalSpacing
        $0.spacing = 8.0
        return $0
    }(UIStackView(arrangedSubviews: [buble2, buble3, buble4, buble5]))
    
    private lazy var commentTitle: UILabel = {
        $0.font = UIFont.boldSystemFont(ofSize: 18.0)
        $0.text = "Пояснительный комментарий оператора"
        return $0
    }(UILabel())
    
    private lazy var commentSubtitle: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14.0)
        $0.text = "Комментарий"
        $0.textColor = grayColor
        return $0
    }(UILabel())
    
    private lazy var inputCommentView: UITextField = {
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.black.cgColor
        $0.placeholder = "Заявка отклонена, дополните следующие данные"
        return $0
    }(UITextField())
    
    private lazy var acceptButton: UIButton = {
        $0.layer.cornerRadius = 12.0
        $0.backgroundColor =  UIColor(red: 0.314, green: 0.318, blue: 0.976, alpha: 1)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.setTitle("Принять", for: .normal)
        $0.addTarget(self, action: #selector(didTappedAccept), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var declineButton: UIButton = {
        $0.layer.cornerRadius = 12.0
        $0.backgroundColor = UIColor(red: 0.913, green: 0.908, blue: 1, alpha: 1)
        $0.setTitleColor(UIColor(red: 0.207, green: 0.211, blue: 0.842, alpha: 1), for: .normal)
        $0.setTitle("Отклонить", for: .normal)
        $0.addTarget(self, action: #selector(didTappedDecline), for: .touchUpInside)
        return $0
    }(UIButton())
    
    // MARK: - view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    func setUp(
        nameOfCompany: String,
        INN: Int,
        legalAddress: String,
        realAddress: String,
        fieldOfWork: String,
        telephone: String,
        email:String,
        website: String
    ) {
        self.formNameOfCompanyValueView.text = nameOfCompany
        self.formINNValueView.text = String(INN)
        self.formLegalAddressValueView.text = legalAddress
        self.formRealAddressValueView.text = realAddress
        self.formFieldValueView.text = fieldOfWork
        self.formTelephoneValueView.text = telephone
        self.formEmailValueView.text = email
        self.formWEBlValueView.text = website
    }
    
    @objc func didTappedAccept() {
        self.dismiss(animated: true) {
            self.parentVC?.dismissedLogic()
        }
    }
    
    @objc func didTappedDecline() {
        self.dismiss(animated: true) {
            self.parentVC?.dismissedLogic()
        }
    }
    
    // MARK: - private methods
    
    private func layout() {
        self.view.addSubview(orderNumberView)
        self.view.addSubview(mainTitle)
        self.view.addSubview(formNameOfCompanyTitleView)
        self.view.addSubview(formNameOfCompanyValueView)
        self.view.addSubview(formINNTitleView)
        self.view.addSubview(formINNValueView)
        self.view.addSubview(formLegalAddressTitleView)
        self.view.addSubview(formLegalAddressValueView)
        self.view.addSubview(formRealAddressTitleView)
        self.view.addSubview(formRealAddressValueView)
        self.view.addSubview(aboutUsView)
        self.view.addSubview(formFieldTitleView)
        self.view.addSubview(formFieldValueView)
        self.view.addSubview(formProductionTitleView)
        self.view.addSubview(bubleStack)
        self.view.addSubview(formTelephoneTitleView)
        self.view.addSubview(formTelephoneValueView)
        self.view.addSubview(formResoursesTitleView)
        self.view.addSubview(resStack)
        self.view.addSubview(commentTitle)
        self.view.addSubview(commentSubtitle)
        self.view.addSubview(inputCommentView)
        self.view.addSubview(acceptButton)
        self.view.addSubview(declineButton)
        self.view.addSubview(generalTitle)
        self.view.addSubview(contactTitle)
        self.view.addSubview(formEmailTitleView)
        self.view.addSubview(formEmailValueView)
        self.view.addSubview(formWEBTitleView)
        self.view.addSubview(formWEBlValueView)
        
        contactTitle.snp.makeConstraints { maker in
            maker.top.equalTo(generalTitle.snp.top)
            maker.trailing.equalToSuperview()
            maker.leading.equalTo(self.view.snp.centerX)
        }
        
        formTelephoneTitleView.snp.makeConstraints { maker in
            maker.leading.equalTo(contactTitle.snp.leading)
            maker.top.equalTo(contactTitle.snp.bottom).offset(littleSpacing)
        }
        
        formTelephoneValueView.snp.makeConstraints { maker in
            maker.leading.equalTo(contactTitle.snp.leading)
            maker.top.equalTo(formTelephoneTitleView.snp.bottom).offset(tinySpacing)
        }
        
        formEmailTitleView.snp.makeConstraints { maker in
            maker.leading.equalTo(contactTitle.snp.leading)
            maker.top.equalTo(formTelephoneValueView.snp.bottom).offset(littleSpacing)
        }
        
        formEmailValueView.snp.makeConstraints { maker in
            maker.leading.equalTo(contactTitle.snp.leading)
            maker.top.equalTo(formEmailTitleView.snp.bottom).offset(tinySpacing)
        }
        
        formWEBTitleView.snp.makeConstraints { maker in
            maker.leading.equalTo(contactTitle.snp.leading)
            maker.top.equalTo(formEmailValueView.snp.bottom).offset(littleSpacing)
        }
        
        formWEBlValueView.snp.makeConstraints { maker in
            maker.leading.equalTo(contactTitle.snp.leading)
            maker.top.equalTo(formWEBTitleView.snp.bottom).offset(tinySpacing)
        }
        
        orderNumberView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalToSuperview().offset(30.0)
        }
        
        mainTitle.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(orderNumberView.snp.bottom).offset(littleSpacing)
        }
        
        generalTitle.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(mainTitle.snp.bottom).offset(bigSpacing)
        }
        
        formNameOfCompanyTitleView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(generalTitle.snp.bottom).offset(littleSpacing)
        }
        
        formNameOfCompanyValueView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formNameOfCompanyTitleView.snp.bottom).offset(tinySpacing)
        }
        
        formINNTitleView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formNameOfCompanyValueView.snp.bottom).offset(littleSpacing)
        }
        
        formINNValueView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formINNTitleView.snp.bottom).offset(tinySpacing)
        }
        
        formLegalAddressTitleView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formINNValueView.snp.bottom).offset(littleSpacing)
        }
        
        formLegalAddressValueView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formLegalAddressTitleView.snp.bottom).offset(tinySpacing)
        }
        
        formRealAddressTitleView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formLegalAddressValueView.snp.bottom).offset(littleSpacing)
        }
        
        formRealAddressValueView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formRealAddressTitleView.snp.bottom).offset(littleSpacing)
        }
        
        aboutUsView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formRealAddressValueView.snp.bottom).offset(bigSpacing)
        }
        
        formFieldTitleView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(aboutUsView.snp.bottom).offset(littleSpacing)
        }
        
        formFieldValueView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formFieldTitleView.snp.bottom).offset(littleSpacing)
        }
        
        formProductionTitleView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formFieldValueView.snp.bottom).offset(littleSpacing)
        }
        
        bubleStack.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formProductionTitleView.snp.bottom).offset(tinySpacing)
            maker.height.equalTo(24.0)
            maker.width.equalTo(84.0)
        }
        
        formResoursesTitleView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(bubleStack.snp.bottom).offset(littleSpacing)
        }
        
        resStack.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(formResoursesTitleView.snp.bottom).offset(tinySpacing)
            maker.height.equalTo(24.0)
            maker.width.equalTo(350.0)
        }
        
        commentTitle.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(resStack.snp.bottom).offset(bigSpacing)
        }
        
        commentSubtitle.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(commentTitle.snp.bottom).offset(littleSpacing)
        }
        
        inputCommentView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.trailing.equalToSuperview().offset(-40.0)
            maker.top.equalTo(commentSubtitle.snp.bottom).offset(littleSpacing)
            maker.height.equalTo(90.0)
        }
        
        acceptButton.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(leadingOffset)
            maker.top.equalTo(inputCommentView.snp.bottom).offset(bigSpacing)
            maker.width.equalTo(120.0)
            maker.height.equalTo(56.0)
        }
        
        declineButton.snp.makeConstraints { maker in
            maker.leading.equalTo(acceptButton.snp.trailing).offset(16.0)
            maker.top.equalTo(inputCommentView.snp.bottom).offset(bigSpacing)
            maker.width.equalTo(120.0)
            maker.height.equalTo(56.0)
        }
        
    }
    
}
