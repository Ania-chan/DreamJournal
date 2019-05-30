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
    
    @IBAction func addDream(_ sender: Any) {
        let newRowIndex = dreamList.dreams.count
        _ = dreamList.addDream()

        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
//    @IBAction func unwindToDreamList(sender: UIStoryboardSegue) {
//        if let sourceViewController = sender.source as? NewDreamViewController, let dream = sourceViewController.dream {
//            let newIndexPath = IndexPath(row: dreamList.dreams.count, section: 0)
//            dreamList.dreams.append(dream)
//
//        }
//    }
    
    required init?(coder aDecoder: NSCoder) {
        dreamList = DreamsList()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        dreamList.dreams.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func configureText(for cell: UITableViewCell, with item: DreamItem) {
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.text
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddDreamSegue" {
            if let addItemViewController = segue.destination as? AddDreamTableViewController {
                addItemViewController.delegate = self
                addItemViewController.dreamList = dreamList
            }
        }
    }

    
}

extension DreamListViewController: AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddDreamTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddDreamTableViewController, didFinishAdding item: DreamItem) {
        navigationController?.popViewController(animated: true)
        let rowIndex = dreamList.dreams.count
        dreamList.dreams.append(item)
        let indexPath = IndexPath(row: rowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    
}
