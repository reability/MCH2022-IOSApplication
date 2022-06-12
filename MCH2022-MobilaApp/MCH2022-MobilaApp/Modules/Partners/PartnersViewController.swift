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


final class PartnersViewController: UIViewController, PartnersView {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, PartnerCardModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, PartnerCardModel>
    
    lazy private var collectionView: UICollectionView = {
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: createLayout()))
    
    lazy private var ds: UICollectionViewDiffableDataSource<Int, PartnerCardModel> = {
        let ds = UICollectionViewDiffableDataSource<Int, PartnerCardModel>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PartnerCollectionViewCell.reuseIdentifier, for: indexPath) as! PartnerCollectionViewCell
            cell.setup()
            return cell
        }
        return ds
    }()
    
    var presenter: Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        collectionView.register(PartnerCollectionViewCell.self, forCellWithReuseIdentifier: PartnerCollectionViewCell.reuseIdentifier)

        layout()
    }
    
    func reload(_ data: [PartnerCardModel], animated: Bool = true) {
        var snapshot = Snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([1])
        snapshot.appendItems(data, toSection: 1)
        ds.apply(snapshot)
        collectionView.reloadData()
    }
    
    private func layout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(144.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(8.0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 4.0, leading: 4.0, bottom: 4.0, trailing: 4.0)
        section.interGroupSpacing = 4.0
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}
