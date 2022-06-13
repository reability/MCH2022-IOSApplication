//
//  PartnersViewController.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation
import UIKit
import SnapKit

protocol PartnersView: AnyObject {
    func reload(_ data: [PartnerCardModel], animated: Bool)
}


final class PartnersViewController: UIViewController, PartnersView, UICollectionViewDelegate {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, PartnerCardModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, PartnerCardModel>
    
    lazy private var counterLabel: UILabel = {
        return $0
    }(UILabel())
    
    lazy private var sideMenuImage: UIImageView = {
        return $0
    }(UIImageView())
    
    lazy private var headerMenuImage: UIImageView = {
        return $0
    }(UIImageView())
    
    lazy private var collectionView: UICollectionView = {
        $0.delegate = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: createLayout()))
    
    lazy private var ds: UICollectionViewDiffableDataSource<Int, PartnerCardModel> = {
        let ds = UICollectionViewDiffableDataSource<Int, PartnerCardModel>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PartnerViewCell.reuseIdentifier, for: indexPath) as! PartnerViewCell
            cell.setup(itemIdentifier)
            return cell
        }
        return ds
    }()
    
    var presenter: Presenter!
    var data: [PartnerCardModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        let nib = UINib(nibName: PartnerViewCell.reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: PartnerViewCell.reuseIdentifier)
        
        layout()
    }
    
    func reload(_ data: [PartnerCardModel], animated: Bool = true) {
        self.data = data
        counterLabel.text = "\(data.count) активных заявки"
        var snapshot = Snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([1])
        snapshot.appendItems(data, toSection: 1)
        ds.apply(snapshot)
        collectionView.reloadData()
    }
    
    private func layout() {
        self.view.addSubview(collectionView)
        self.view.addSubview(counterLabel)
        self.view.addSubview(sideMenuImage)
        self.view.addSubview(headerMenuImage)
        
        collectionView.backgroundColor = UIColor(red: 0.95, green: 0.951, blue: 0.97, alpha: 1)
        
        counterLabel.textColor = UIColor(red: 0.424, green: 0.448, blue: 0.492, alpha: 1)
        sideMenuImage.image = UIImage(named: "Menu")
        headerMenuImage.image = UIImage(named: "Header")
        headerMenuImage.contentMode = .scaleAspectFill
        sideMenuImage.contentMode = .scaleAspectFit
        
        sideMenuImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalTo(collectionView.snp.leading)
            make.width.equalTo(86)
        }
        
        headerMenuImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalTo(sideMenuImage.snp.trailing)
            make.bottom.equalTo(counterLabel.snp.top).offset(30)
            make.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.leading.equalTo(sideMenuImage.snp.trailing).offset(24)
            make.top.equalToSuperview().offset(40)
            make.height.equalTo(30)
        }
        
        collectionView.snp.makeConstraints { maker in
            maker.top.equalTo(counterLabel.snp.bottom).offset(20)
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
    
    func dismissedLogic() {
        guard var firstData = data.first else { return }
        firstData.status = "Принят"
        reload([firstData], animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let superVC = SuperViewController()
        superVC.parentVC = self
        let model = data[indexPath.row]
        superVC.setUp(nameOfCompany: model.nameCompany, INN: Int(model.INN) ?? 0, legalAddress: model.legalAddress, realAddress: model.realAddress, fieldOfWork: model.production, telephone: model.telephone, email: model.email, website: model.website)
        self.present(superVC, animated: true)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(184.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(24.0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 4.0, leading: 24, bottom: 4.0, trailing: 24)
        section.interGroupSpacing = 40.0
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}
