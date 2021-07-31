//
//  TableViewCell.swift
//  Table-View-in-a-Collection-View-Cell
//
//  Created by bookpro on 2021/07/31.
//  Copyright © 2021 routeflags. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
	static let reuseIdentifier = String(describing: TableViewCell.self)

	override init(style: UITableViewCell.CellStyle,
				  reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
