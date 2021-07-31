//
//  CollectionCell.swift
//  Table-View-in-a-Collection-View-Cell
//
//  Created by bookpro on 2021/07/31.
//  Copyright © 2021 routeflags. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

	static let reuseIdentifier = String(describing: CollectionCell.self)

	var collectionItem: CollectionItem? {
		didSet {
			if let collectionItem = collectionItem {
				nameLabel.text = collectionItem.name
			}
		}
	}
	
	private let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.numberOfLines = 0
		label.sizeToFit()
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		sharedInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		sharedInit()
	}
	
	private func sharedInit() {
		addSubview(nameLabel)
		nameLabel.anchor(top: topAnchor,
						 left: leftAnchor,
						 right: rightAnchor,
						 paddingTop: 10)
	}
}
