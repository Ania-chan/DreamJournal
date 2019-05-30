//
//  AddDreamTableViewController.swift
//  DreamJournal
//
//  Created by Anna Nakayama on 2019/05/30.
//  Copyright © 2019 Anna Nakayama. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddDreamTableViewController)
    func addItemViewController(_ controller: AddDreamTableViewController, didFinishAdding item: DreamItem)
}

class AddDreamTableViewController: UITableViewController {
    
    weak var delegate: AddItemViewControllerDelegate?
    weak var dreamList: DreamsList?
    weak var dreamToEdit: DreamItem?
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        let dream = DreamItem()
        if let textFieldText = textfield.text {
            dream.text = textFieldText
        }
        delegate?.addItemViewController(self, didFinishAdding: dream)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textfield.becomeFirstResponder()
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension AddDreamTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textfield.text,
            let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
    
}
