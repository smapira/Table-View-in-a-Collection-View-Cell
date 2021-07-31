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

	var tableView: UITableView? = TableViewController().view as? UITableView
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		sharedInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		sharedInit()
	}
	
	func setTableViewDelegate<D: UITableViewDataSource & UITableViewDelegate>(_ delegate: D,
																			  forRow row: Int,
																			  forItem item: Int) {
		if let tableView = self.tableView {
			tableView.delegate = delegate
			tableView.dataSource = delegate
			tableView.tag = row
			tableView.reloadData()
		}
	}
	
	private func sharedInit() {
		if let tableView = self.tableView {
			addSubview(tableView)
		}
	}
}
