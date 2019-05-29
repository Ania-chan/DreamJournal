//
//  DreamListViewController.swift
//  DreamJournal
//
//  Created by Anna Nakayama on 2019/05/28.
//  Copyright © 2019 Anna Nakayama. All rights reserved.
//

import UIKit

class DreamListViewController: UITableViewController {
    
    var dreamList: DreamsList
    
    required init?(coder aDecoder: NSCoder) {
        dreamList = DreamsList()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dreamList.dreams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DreamItem", for: indexPath)
        let item = dreamList.dreams[indexPath.row]
        configureText(for: cell, with: item)
        return cell
    }
    
    func configureText(for cell: UITableViewCell, with item: DreamItem) {
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.text
        }
    }
    
}
