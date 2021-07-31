//
//  TableViewController.swift
//  Table-View-in-a-Collection-View-Cell
//
//  Created by bookpro on 2021/07/31.
//  Copyright © 2021 routeflags. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

	// MARK: - UITableViewController
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(TableViewCell.self,
						   forCellReuseIdentifier: TableViewCell.reuseIdentifier)
		tableView.reloadData()
	}
}
