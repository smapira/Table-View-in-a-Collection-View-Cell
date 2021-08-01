//
//  ViewController.swift
//  Table-View-in-a-Collection-View-Cell
//
//  Created by bookpro on 2021/07/31.
//  Copyright © 2021 routeflags. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
	var tableItems: [[UIColor]] = []
	let defaultCollectionItemNumber = 2

	init() {
		super.init(collectionViewLayout: UICollectionViewFlowLayout())
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView?.backgroundColor = UIColor.white
		self.collectionView!.register(CollectionCell.self,
									  forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
		self.tableItems = generateRandomData()
		self.collectionView?.reloadData()

		Timer.scheduledTimer(withTimeInterval: 20,
							 repeats: true) { timer in
			self.tableItems = generateRandomData()
			self.collectionView?.reloadData()
			timer.invalidate()
		}
	}

	//MARK: - UICollectionViewDataSource
	
	override func collectionView(_ collectionView: UICollectionView,
								 numberOfItemsInSection section: Int) -> Int {
		return defaultCollectionItemNumber
	}
	
	override func collectionView(_ collectionView: UICollectionView,
								 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView
			.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseIdentifier,
								 for: indexPath) as! CollectionCell
		cell.setTableViewDelegate(self,
								  forRow: indexPath.row,
								  forItem: indexPath.item)
		return cell
	}

	// MARK: - UICollectionViewDelegate
	override func collectionView(_ collectionView: UICollectionView,
								 willDisplay cell: UICollectionViewCell,
								 forItemAt indexPath: IndexPath) {
		guard let collectionCell = cell as? CollectionCell else { return }

		collectionCell.setTableViewDelegate(self,
											forRow: indexPath.row,
											forItem: indexPath.item)
	}

	override func collectionView(_ collectionView: UICollectionView,
								 didEndDisplaying cell: UICollectionViewCell,
								 forItemAt indexPath: IndexPath) {
		guard let collectionCell = cell as? CollectionCell else { return }

		collectionCell.setTableViewDelegate(self,
											forRow: indexPath.row,
											forItem: indexPath.item)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width,
					  height: view.frame.height / 2)
	}
}

extension CollectionViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView,
				   didSelectRowAt indexPath: IndexPath) {
		print("Table view at row selected index path \(indexPath)")
	}
}

extension CollectionViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return tableItems.count
	}
	
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier,
												 for: indexPath) as! TableViewCell
		cell.backgroundColor = tableItems[tableView.tag][indexPath.row]
		return cell
	}
	
	
}
