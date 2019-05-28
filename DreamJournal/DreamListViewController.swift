//
//  DreamListViewController.swift
//  DreamJournal
//
//  Created by Anna Nakayama on 2019/05/28.
//  Copyright © 2019 Anna Nakayama. All rights reserved.
//

import UIKit

class DreamListViewController: UITableViewController {
    
    //MARK: Properties
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DreamItem", for: indexPath)
        return cell
    }
    
}
