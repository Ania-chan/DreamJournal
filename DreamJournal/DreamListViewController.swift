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
    
    @IBAction func deleteItems(_ sender: Any) {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            var items = [DreamItem]()
            for indexPath in selectedRows {
                items.append(dreamList.dreams[indexPath.row])
            }
            dreamList.remove(items: items)
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        dreamList = DreamsList()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(tableView.isEditing, animated: true)
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
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dreamList.move(item: dreamList.dreams[sourceIndexPath.row], to: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func configureText(for cell: UITableViewCell, with item: DreamItem) {
        if let label = cell.viewWithTag(1000) as? UILabel, let content = cell.viewWithTag(800) as? UILabel {
            label.text = item.text
            content.text = item.content
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddDreamSegue" {
            if let addItemViewController = segue.destination as? AddDreamTableViewController {
                addItemViewController.delegate = self
                addItemViewController.dreamList = dreamList
            }
        } else if segue.identifier == "EditDreamSegue" {
            if let addItemViewController = segue.destination as? AddDreamTableViewController {
                if let cell = sender as? UITableViewCell,
                    let indexPath = tableView.indexPath(for: cell) {
                    let item = dreamList.dreams[indexPath.row]
                    addItemViewController.dreamToEdit = item
                    addItemViewController.delegate = self
                }
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
        let rowIndex = dreamList.dreams.count - 1
        let indexPath = IndexPath(row: rowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    func addItemViewController(_ controller: AddDreamTableViewController, didFinishEditing item: DreamItem) {
        if let index = dreamList.dreams.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    
}
